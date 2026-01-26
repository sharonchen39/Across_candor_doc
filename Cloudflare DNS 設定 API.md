# DNS 設定管理頁面技術說明文件

本文件詳細說明了 DNS 設定管理頁面的前端 UI 實作、後端 API 路由以及兩者之間的串接邏輯。

## 1. 功能概述

該頁面（`frontend/app/dashboard/cloudflare/dns-settings/page.tsx`）是 Cloudflare 網域管理的核心介面，提供以下功能：
*   **主域名 (Zone) 管理**：建立、驗證（TXT Record）及刪除網域。
*   **DNS 記錄管理**：A、AAAA、CNAME 記錄的增刪查改，支援 Proxy 開關、TTL 設定、標籤與註解。
*   **批量操作**：支援 TXT 格式檔案的匯入與匯出。
*   **邊緣憑證 (Edge Certificates)**：上傳與管理自訂 SSL 憑證。

---

## 2. 前後端串接架構

### A. 前端請求層 (`app/routes/cloudflare.ts`)
前端透過封裝好的 API 函數與後端通訊：
*   `getZonesByContractNo(contractNo)`: 獲取網域列表。
*   `createZone(data)`: 建立新網域。
*   `deleteZone(data)`: 刪除網域。
*   `getDnsByContractNo(contractNo)`: 獲取 DNS 紀錄。
*   `createDnsRecord(data)`: 建立 DNS 記錄。
*   `updateDnsRecord(data)`: 修改 DNS 記錄。
*   `deleteDnsRecord(data)`: 刪除 DNS 記錄。
*   `exportZoneSubdomains(data)`: 匯出 Cloudflare 上 DNS 紀錄。
*   `importZoneSubdomains(data)`: 批量匯入 DNS 紀錄。
*   `getCertificateByContractNo(contractNo)`: 獲取邊緣憑證。
*   `uploadCustomCertificate(data)`: 上傳自訂邊緣憑證。
*   `uploadCustomCertificate(Data)`: 刪除自訂邊緣憑證。

### B. 後端路由層 (`server/routes/cloudflare_setting.ts`)
後端採用 Express 路由，並整合了多個中間件：
*   `wafSettingAuthorizer`: 驗證用戶是否有權限修改該合約的設定。
*   `dbTransactionHandler`: 確保資料庫與 Cloudflare API 操作的原子性。
*   `asyncHandler`: 統一處理非同步錯誤，並整合自動 Log 紀錄功能。

---

## 3. API 介面定義

| 功能 | 方法 | 端點 | 關鍵參數 |
| :--- | :--- | :--- | :--- |
| **獲取網域列表** | GET | `/zones/:contractNo` | `contractNo` |
| **建立主域名** | POST | `/` | `zone`, `dnsSetupMethod` |
| **刪除主域名** | DELETE | `/:contractNo/:zone` | `contractNo`, `zone` |
| **獲取 DNS 記錄** | GET | `/dns/:contractNo` | `contractNo` |
| **建立 DNS 記錄** | POST | `/dns_record` | `name`, `type`, `content`, `proxied`, `ttl` |
| **更新 DNS 記錄** | POST | `/dns_record/:name` | `id`, `content`, `comment`, `tags` |
| **刪除 DNS 記錄** | POST | `/delete_dns_record/:contractNo/:zone` | `contractNo`, `zone`, `name`, `id` |
| **匯出 DNS 紀錄** | POST | `/export_zone_subdomains/:contractNo` | `contractNo` |
| **匯入 DNS 記錄** | POST | `/import_zone_subdomains/:contractNo` | `zone`, `content` (BIND text) |
| **獲取邊緣憑證** | GET | `/certificate/:contractNo` | `contractNo` |
| **上傳自訂憑證** | POST | `/certificate/:contractNo` | `certificate`, `privateKey`, `zone` |
| **刪除自訂憑證** | DELETE | `/certificate/:contractNo/:zone/:certificateId` | `contractNo`, `zone`, `certificateId`, `hosts` |

---

## 4. 關鍵技術實作

### 1. 自動 Log 紀錄
後端路由在 `asyncHandler` 中傳入 `logOptions`，系統會自動在操作成功或失敗時紀錄 `logAction`：
```typescript
// 範例：自動紀錄建立網域的動作
router.post('/', [wafSettingAuthorizer], asyncHandler(async (req) => {
    // 業務邏輯...
}, ..., { action: 'create', type: 'zone' }));
```

### 2. 資料驗證邏輯 (Frontend Validation)
前端在送出請求前會進行嚴格驗證，減少無效請求：
*   `validateIPv4` / `validateIPv6`: 驗證 IP 格式。
*   `validateDomain`: 驗證域名格式（排除協議前綴與路徑）。
*   `ttlToChinese`: 將秒數轉換為易讀的中文標籤。

### 3. 憑證處理
*   支援從檔案讀取憑證內容 (`readFileContent`)。
*   支援多種組合方法（Ubiquitous, Optimal）與舊版用戶端支援（SNI 設定）。

---

## 5. 檔案匯入/匯出規範
*   **匯出**: 系統會將網域下的 DNS 記錄轉換為標準 BIND 格式，並透過 `Blob` 觸發瀏覽器下載。
*   **匯入**: 接收 `.txt` 或 `.csv` 檔案，解析後逐筆同步至 Cloudflare 並寫入本地資料庫。

---
**文件狀態**: 技術參考手冊  
**最後更新**: 2026-01-26
