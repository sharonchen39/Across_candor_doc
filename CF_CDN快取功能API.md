# cloudflare CDN Cache 功能 API 

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
|---|---|---|---|
|browser_ttl|Object|Y|瀏覽器TTL規則|
|edge_ttl|Object|Y|邊緣TTL規則 |
|cache|String|Y|是否開啟快取, 如果cache=false，則無需browser_ttl及edge_ttl參數|
|conditions|Array|N|自定義快取規則的觸發條件|

### ttl fields

|Attribute|Type|Required|Description|
|---|---|---|---|
|browser_ttl.mode   |String |Y |瀏覽器TTL規則模式, bypass/respect_origin/override_origin, 預設為respect_origin|
|browser_ttl.default|Number |Y |TTL存留時間, 預設為1, 單位為秒 |
|edge_ttl.mode      |String |Y |邊緣TTL規則模式, bypass_by_default/respect_origin/override_origin, 預設為respect_origin|
|edge_ttl.default   |Number |Y |TTL存留時間, 預設為0, 單位為秒, 只有在mode為override_origin時才需此參數 |

### conditions fields

|Attribute|Type|Required|Description|
|---|---|---|---|
|field            |String |Y |條件欄位, full_uri/file_extension, 預設為完整URI(full_uri)|
|operator         |String |Y |運算子,  full_uri: wildcard,eq,ne,contains,not_contains,starts_with,ends_with; file_extension: eq,ne,in,not_in |
|value            |String |Y |條件值|
|logicalOperator  |Number |Y |條件群組邏輯式, and/or, 條件群組: [[A,B], [C,D]]為(A adn B) or (C and D) |


### input Example (logicalOperator: And)
```json
{
  "zone": "adasone.site",
  "name": "api.adasone.site",
  "cdnCache": {
    "browser_ttl": {
      "default": 1,
      "mode": "respect_origin"
    },
    "edge_ttl": {
      "default": 0,
      "mode": "respect_origin"
    },
    "cache": "true",
    "conditions": [
      {
        "field": "full_uri",
        "logicalOperator": null,
        "operator": "wildcard",
        "value": "https://*.example.com/files/*"
      },
      {
        "field": "full_uri",
        "logicalOperator": "and",
        "operator": "eq",
        "value": "https://example.com/contact"
      }
    ]
  }
}
```
<img width="804" height="361" alt="image" src="https://github.com/user-attachments/assets/e4338509-1e4f-4de9-9e67-6ac15525d4c7" />


### input Example (logicalOperator: Or)
```json
{
  "zone": "adasone.site",
  "name": "api.adasone.site",
  "cdnCache": {
    "browser_ttl": {
      "default": 1,
      "mode": "respect_origin"
    },
    "edge_ttl": {
      "default": 0,
      "mode": "respect_origin"
    },
    "cache": "true",
    "conditions": [
      {
        "field": "full_uri",
        "logicalOperator": null,
        "operator": "wildcard",
        "value": "https://*.example.com/files/*"
      },
      {
        "field": "full_uri",
        "logicalOperator": "or",
        "operator": "eq",
        "value": "https://example.com/contact"
      }
    ]
  }
}
```
<img width="777" height="278" alt="image" src="https://github.com/user-attachments/assets/63d4f09b-4192-4958-92df-e2098f266736" />


### input Example (logicalOperator: And + Or)
```json
{
  "zone": "adasone.site",
  "name": "api.adasone.site",
  "cdnCache": {
    "browser_ttl": {
      "default": 1,
      "mode": "respect_origin"
    },
    "edge_ttl": {
      "default": 0,
      "mode": "respect_origin"
    },
    "cache": "true",
    "conditions": [
      {
        "field": "full_uri",
        "logicalOperator": null,
        "operator": "wildcard",
        "value": "https://*.example.com/files/*"
      },
      {
        "field": "full_uri",
        "logicalOperator": "and",
        "operator": "eq",
        "value": "https://example.com/contact"
      },
      {
        "field": "file_extension",
        "logicalOperator": "or",
        "operator": "eq",
        "value": "mp3"
      },
      {
        "field": "file_extension",
        "logicalOperator": "and",
        "operator": "in",
        "value": "mp3,mp4"
      }
    ]
  }
}
```
<img width="774" height="449" alt="image" src="https://github.com/user-attachments/assets/11be3f3b-722c-4a1f-b0af-97a984b50fe6" />


### Response fields

|Attribute|Type|Required|Description|
|---|---|---|---|
|result   |String  |Y|cloudflare回傳的result|
|success  |Boolean |Y||
|errors   |object  |Y||
|messages |object  |Y||

### Example Response
```json
{
  "result": {
    "description": "Custom Cache Purge Ruleset",
    "id": "27bb6f4a92f14da1a2b6c77ca1d20b4b",
    "kind": "zone",
    "last_updated": "2026-01-02T01:52:12.643326Z",
    "name": "cache_purge",
    "phase": "http_request_cache_settings",
    "rules": [
      {
        "action": "set_cache_settings",
        "action_parameters": {
          "browser_ttl": {
            "mode": "respect_origin"
          }
          "cache": true,
          "edge_ttl": {
            "mode": "respect_origin"
          }
        },
        "description": "cache_api.adasone.site",
        "enabled": true,
        "expression": "(http.request.full_uri wildcard r\"https://*.example.com/files/*\" and http.request.full_uri eq \"https://example.com/contact\" and http.host eq \"adasone.site\") or (http.request.uri.path.extension in {\"mp3\"} and http.host eq \"adasone.site\")",
        "id": "cd863505b55a46f2ba1d1362aaf67b67",
        "last_updated": "2026-01-02T02:17:44.095161Z",
        "ref": "cd863505b55a46f2ba1d1362aaf67b67",
        "version": "6"
      }
    ],
    "version": "6"
  },
  "success": true,
  "errors": [],
  "messages": []
}
```


## Cloudflare API

```
1. GET ZoneID By Zone Name
https://api.cloudflare.com/client/v4/zones?name=${zoneName}

2. GET Rule List By ZoneId
https://api.cloudflare.com/client/v4/zones/${zoneId}/rulesets

3. Find Rule Where phase=http_request_cache_settings And GET RuleId

4. GET Cache Rule List By RuleId
https://api.cloudflare.com/client/v4/zones/${zoneId}/rulesets/${ruleId}

5. GET Cache Rule By Domain Name (cache_${domainName}

6. POST or PATCH Settings
[PATCH] https://api.cloudflare.com/client/v4/zones/${zoneId}/rulesets/${ruleId}/rules/${cacheRuleId}
[POST] https://api.cloudflare.com/client/v4/zones/${zoneId}/rulesets/${ruleId}/rules
{
  "description": "cache_${domainName}",
  "action": "set_cache_settings",
  "action_parameters": {
  "cache": true,
  "browser_ttl": {
    "mode": "override_origin",
    "default": 1
  },
  "edge_ttl": {
    "mode": "override_origin",
    "default": 1
  }
  "enabled": true,
  "expression": "expression": "(http.request.full_uri wildcard r\"https://*.example.com/files/*\" and http.request.full_uri eq \"https://example.com/contact\" and http.host eq \"adasone.site\") or (not http.request.uri.path.extension in {\"mp3\" \"mp4\" \"eeee\"} and http.host eq \"adasone.site\")"
}
```
