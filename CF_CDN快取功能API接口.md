# cloudflare CDN Cache 功能 API 接口

## POST: http://localhost:3001/api/internal/cloudflare_setting/cdn_cache/:contractNo
- 增設 cloudflare CDN Cache 功能API

### Parameter fields

|Attribute|Type|Required|Description|
|---|---|---|---|
|contractNo|String|Y|合約編號, 必填|
|name|String|Y|子域名, 必填|
|zone|String|Y|主域名, 必填|
|cdnCache|Object|Y|CDN Cache 設定內容, JSON|

### cdnCache fields

|Attribute|Type|Required|Description|
|browser_ttl|Object|Y|瀏覽器TTL規則|
|edge_ttl|Object|Y|邊緣TTL規則 |
|cache|Boolean|Y|是否開啟快取|
|conditions|Array|N|自定義快取規則的觸發條件|


### Example
```json
{
  "inputs": {
      },
}
```
