# Cloudflare 報表系統技術說明文件

本文件詳細說明了系統如何從 Elasticsearch (ES) 獲取 Cloudflare 日誌數據，並將其轉換為前端儀表板所需的各項指標與圖表。

## 1. 核心資料來源與 API

報表系統主要依賴於 **Elasticsearch** 作為後端資料倉儲，前端透過自定義 Hook 與後端 API 進行互動。

### 核心 API 與索引
*   **數據獲取**: 透過 `useElasticsearchAggregation` Hook 發送聚合查詢請求。
*   **索引名稱**: `across-cf-logpush-*` (儲存 Cloudflare Logpush 傳送的原始日誌)。
*   **過濾機制**: 透過 `getZoneFilter(zones)` 確保資料權限，若無指定網域則不回傳任何資料。

### 關鍵日誌欄位 (Cloudflare Log Fields)
| 欄位名稱 | 說明 | 用途 |
| :--- | :--- | :--- |
| `EdgeResponseBytes` | 邊緣節點回傳的位元組數 | 計算流量、頻寬、峰值 |
| `EdgeStartTimestamp` | 請求開始時間 | 時間序列圖表、峰值計算基準 |
| `SecurityActions` | 安全動作 (block, log, skip, jschallenge, managedChallenge) | 區分攻擊事件與正常請求 |
| `SecuritySources` | 安全來源 (l7ddos, waf, etc.) | 識別攻擊類型 (如 DDoS) |
| `CacheCacheStatus` | 快取狀態 (hit, miss, none, etc.) | 計算快取命中率 |
| `ClientRequestHost` | 客戶端請求的網域名稱 | 網域排名 (Top Hosts) |
| `ClientRequestURI` | 請求的路徑 | URL 排名 (Top URLs) |
| `ClientIP` | 客戶端來源 IP | 攻擊來源 IP 排名 |
| `geoip_client.geo` | 地理位置資訊 | 攻擊來源國家/城市分布 |

---

## 2. 主要報表指標計算邏輯

### A. WAF 安全事件 (WAF Events)
*   **已阻擋 (Blocked)**: 統計 `SecurityActions` 為 `['block', 'jschallenge', 'managedChallenge']` 的次數，功能命名 `getWafEventsCount`。
*   **僅監控 (Monitored)**: 統計 `SecurityActions` 為 `['log', 'skip']` 且排除 `block` 的次數，功能命名 `getWafEventsCount`。
*   **前期對比**: 
    *   計算當前時間範圍長度（如 1 小時）。
    *   計算前期時間範圍（當前開始時間往前推 1 小時）。
    *   使用 `calculateChange` 計算百分比變化。
*   **Top10 攻擊來源國家分布**:
    *   統計 `geoip_client.geo.country_name.keyword` 前10大次數，功能命名 `useAttackGeoSources`。
    *   使用 `getCountryCoordinateOrDefault` 獲取國家經緯度進行畫圖
*   **流量趨勢數據**: 依當前時間範圍聚合fixed_interval獲取每段時間區間內 `SecurityActions` 為 `['log', 'skip', 'block', 'managedChallenge', 'jschallenge']` 的次數統計，功能命名 `useTrafficTrend`。
*   **頻寬流量趨勢**: 依當前時間範圍聚合fixed_interval獲取每段時間區間內 `SecurityActions` 為 `['log', 'skip', 'block', 'managedChallenge', 'jschallenge']` 的 `EdgeResponseBytes`統計，功能命名 `useTrafficTrendBps`。
*   **WAF 事件趨勢**: 依當前時間範圍聚合fixed_interval獲取每段時間區間內 `SecurityActions` 分別為`['block', 'jschallenge', 'managedChallenge']` 及 `['log', 'skip']` 的次數統計，功能命名 `useWafEventTrend`。
*   **Top5 被攻擊網域**: 統計 `ClientRequestHost.keyword` 前5大次數，功能命名 `useTopAttackedHosts`。
*   **Top10 攻擊來源城市**: 統計 `geoip_client.geo.city_name.keyword` 前10大次數，功能命名 `useAttackCitySources`。
*   **Top10 被攻擊URL**: 統計 `ClientRequestURI.keyword` 前10大次數，並針對每個 URI 找出對應的 `ClientRequestHost.keyword`，功能命名 `useTopAttackedUrls`。
*   **Top10 被攻擊URL**: 統計 `ClientRequestURI.keyword` 前10大次數，並針對每個 URI 找出對應的 `ClientRequestHost.keyword`，並獲取國家名稱 `geoip_client.geo.country_name.keyword` 及國家代碼 `ClientCountry.keyword` ，功能命名 `useTopAttackedUrls`。

### B. DDoS 攻擊分析
*   **攻擊峰值 (Attack Peak)**:
    *   **篩選**:    `SecuritySources: l7ddos`
    *   **動態分桶**: 透過 `getPeakInterval` 根據時間範圍決定計算精度（如 30 分鐘內用 `1s` 間隔，24 小時用 `1m` 間隔）。
    *   **計算方式**: 取各時間分桶中 `EdgeResponseBytes` 總和的最大值，並轉換為 bps (bits per second)。
    *   **功能命名**: `useAttackPeak`
*   **已清洗流量 (Cleaned Traffic)**: 篩選 `SecuritySources: l7ddos` 且 `SecurityActions.keyword` 為 `['block', 'jschallenge', 'managedChallenge']` ，被執行安全動作的流量 `EdgeResponseBytes` 總和，功能命名 `useCleanedTrafficCount`。
*   **以清洗流量趨勢**:  篩選 `SecuritySources: l7ddos` 且依當前時間範圍聚合fixed_interval獲取每段時間區間內 `SecurityActions` 為 `['log', 'skip', 'block', 'managedChallenge', 'jschallenge']` 的 `EdgeResponseBytes`統計，功能命名 `useCleanedTrafficTrend`
*   **Top5 被DDoS的網域**: 篩選 `SecuritySources: l7ddos` 且前五大 `ClientRequestHost.keyword` 的 `EdgeResponseBytes` 流量總計，功能命名 `useTopDDoSHosts`。
*   **Top10 攻擊來源IP**: 篩選 `SecuritySources: l7ddos` 且前十大 `ClientIP.keyword` 的 `EdgeResponseBytes` 流量總計，功能命名 `useTopDDoSHosts`。

### C. CDN 性能與快取
*   **快取命中率 (Cache Hit Rate)**: 
    *   **請求命中率**: `CacheCacheStatus: hit` 的請求數 / 總請求數。
    *   **流量命中率**: `CacheResponseBytes` 總和 / 總傳輸流量。
*   **源站錯誤率**: 監控 `OriginResponseStatus` 在 500-599 之間的比例。
*   **CDN 總傳輸流量**: `EdgeResponseBytes` 計算總流量， `OriginResponseTime` 計算平均量， `CacheResponseBytes`計算快取總流量，功能命名 `useCdnTotalTraffic`。
*   **CDN 流量趨勢**: 依當前時間範圍聚合fixed_interval獲取每段時間區間內 `CacheCacheStatus.keyword` 快取狀態時序圖，功能命名 `useCdnTrafficTrend`。
*   **Top5 CDN節點**: 統計前五大 `EdgeColoCode.keyword` 次數及統計平均原站回應時間 `OriginResponseTime`，功能命名 `useTopCdnNodes`。
*   **Top10 快取狀態統計**: 統計前十大 `CacheCacheStatus.keyword` 次數，功能命名 `useCdnCacheStatusChart`。
*   **Top10 HTTP狀態碼**: 統計前十大 `CacheResponseStatus` 次數，功能命名 `useCdnHttpStatus`。

---

## 3. 系統配置與自動化處理

### A. 自動時間間隔調整 (`getTrafficInterval`)
為了優化圖表顯示效果與查詢效能，系統會根據選擇的時間範圍自動調整 ES 聚合的 `fixed_interval`：
*   **≤ 15 分鐘**: `1m`
*   **≤ 24 小時**: `30m`
*   **≤ 30 天**: `6h`
*   **> 365 天**: `7d`

### B. 單位自動轉換 (`formatTrafficVolume` & `formatPeakRate`)
*   **流量單位**: 自動切換 `B`, `KB`, `MB`, `GB`, `TB`。
*   **頻寬單位**: 自動切換 `bps`, `Kbps`, `Mbps`, `Gbps`, `Tbps`。
*   **精度處理**: 若換算後小數點兩位為 `0.00`，則自動降階單位以顯示更精確的數值。

### C. 圖表數據對齊 (Gap Filling)
*   在 `useTrafficTrend` 等 Hook 中，系統會處理 ES 回傳的 `buckets`。
*   確保首尾資料點對齊用戶選擇的時間範圍，避免圖表前後留白。
*   針對 CDN 狀態等類別型數據，預先初始化所有狀態為 `0`，防止線條因缺失數據而中斷。

---

## 4. 後端介接API

### [POST] /api/internal/elasticsearch/search

### Parameter fields
|Attribute|Type|Required|Description|
|---|---|---|---|
|index|String|N|值：across-cf-logpush-*|
|body |Object|N|{ query, aggs, size } |

### 用 Axios 串接 ES Client
1.  **Client 配置**:
```typescript
export const esClient = new Client({
    node: config.database.elasticsearch.host || 'http://localhost:9200',
    auth: config.database.elasticsearch.apiKey 
      ? { apiKey: config.database.elasticsearch.apiKey }
      : config.database.elasticsearch.username && config.database.elasticsearch.password
      ? {
          username: config.database.elasticsearch.username,
          password: config.database.elasticsearch.password
        }
      : undefined,
    tls: {
      rejectUnauthorized: false
    }
})
```
2.  **Search調用**:
```typescript
const response = await esClient.search({
   index,
   body
});
```

---

## 5. 開發參考範例

若需新增報表，可參考以下標準流程：

1.  **定義聚合配置**:
    ```typescript
    const aggregationConfig = {
      waf_blocked_events: {
        filter: {
          bool: {
            must: [
              { terms: { 'SecurityActions.keyword': ['block', 'jschallenge', 'managedChallenge'] } }
            ],
            ...(zoneFilter ? { filter: [zoneFilter] } : {})
          }
        }
      },
      waf_monitored_events: {
        filter: {
          bool: {
            must: [
              { terms: { 'SecurityActions.keyword': ['log', 'skip'] } }
            ],
            must_not: [
              { term: { 'SecurityActions.keyword': 'block' } }
            ],
            ...(zoneFilter ? { filter: [zoneFilter] } : {})
          }
        }
      }
    }
    ```
2.  **定義時間區間聚合配置**:
    ```typescript
    const aggregationConfig = {
      traffic_over_time: {
        date_histogram: {
        field: '@timestamp',
        fixed_interval: interval,
        min_doc_count: 0,
        extended_bounds: timeRange ? {
          min: new Date(timeRange.from).toISOString(),
          max: new Date(timeRange.to).toISOString()
        } : undefined
      },
      aggs: {
        filtered_traffic: {
          filter: zoneFilter || { match_all: {} },
            aggs: {
              log_count: { filter: { term: { 'SecurityActions.keyword': 'log' } } },
              block_count: { filter: { term: { 'SecurityActions.keyword': 'block' } } },
              skip_count: { filter: { term: { 'SecurityActions.keyword': 'skip' } } },
              managed_count: { filter: { term: { 'SecurityActions.keyword': 'managedChallenge' } } },
              jschallenge_count: { filter: { term: { 'SecurityActions.keyword': 'jschallenge' } } },
            }
          }
        }
      }
    }
    ```
3.  **調用數據 Hook**:
    ```typescript
    const { data } = useElasticsearchAggregation('across-cf-logpush-*', aggregationConfig);
    ```
4.  **格式化輸出**: 使用 `useMemo` 處理數據轉換，並調用 `formatTrafficVolume` 進行單位轉換。

---
**文件狀態**: 技術參考手冊  
**最後更新**: 2026-01-26
