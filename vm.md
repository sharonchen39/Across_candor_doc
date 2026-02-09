# VM 建置文件

## 1. git 專案
```
git clone git@github.com:Twister5rd/Across-candor.git
cd Across/candor/frontend
npm install
npm run build
pm2 start npm --name "across-frontend" -- start

git clone git@github.com:Twister5rd/adas-one-backend.git
cd adas-one-backend
npm install
npm run build
pm2 start npm --name "across-backend" -- start

mysql -utwister5 -p adas_one < /root/across.sql
```

---


## 2. ELK

### Kibana yml
```
server.port: 5601
server.host: "0.0.0.0"
server.ssl.enabled: true
server.ssl.certificate: /etc/kibana/ca/kibana.crt
server.ssl.key: /etc/kibana/ca/kibana.key
elasticsearch.hosts: ["https://localhost:9200"]
elasticsearch.username: "kibana_system"
elasticsearch.password: "twister5@f5"
elasticsearch.ssl.certificateAuthorities: [ "/etc/kibana/ca/http_ca.crt" ]
elasticsearch.ssl.verificationMode: none

xpack.encryptedSavedObjects.encryptionKey: bae9538732f2391737093dfbd90ef642
xpack.reporting.encryptionKey: bb6071a4909e453f6e442b572f69fd92
xpack.security.encryptionKey: 49438c74be6a4ef8c8ae7876c74cb255
```

### Elasticsearch yml
```
path.data: /var/lib/elasticsearch
path.logs: /var/log/elasticsearch
xpack.security.enabled: true
xpack.security.enrollment.enabled: true
xpack.security.http.ssl:
  enabled: true
  keystore.path: certs/http.p12
xpack.security.transport.ssl:
  enabled: true
  verification_mode: certificate
  keystore.path: certs/transport.p12
  truststore.path: certs/transport.p12
cluster.initial_master_nodes: ["Across01"]
http.host: 0.0.0.0
```

### Logstash
/etc/logstash 放入檔案
```
GeoLite2-City.mmdb  cfwaf_score.yaml  logstash.crt  logstash.key logstash_rsa.key
```
/etc/logstash/conf.d/cf-logpush.conf

---


## 3. Cloudflared 建立網域名稱及Logpush 通道

### 於 Cloudflare 上登入這台VM，建立起/root/.cloudflare/cert.pem
```
cloudflared tunnel login
// 複製URL後點選要註冊網域的Zone
```

### 建立 Cloudflared tunnel
```
cloudflared tunnel create across-prod
/// 記下產生的ID，EX: 95f9612c-7312-46b5-958e-fc1fa4fce2e8

vim /root/.cloudflared/config.yml

tunnel: 00676031-753c-44ff-af34-40070ad903ab
credentials-file: /root/.cloudflared/00676031-753c-44ff-af34-40070ad903ab.json

ingress:
  - hostname: across-candor.twister5.cf
    path: /api/logs*
    service: https://localhost:38383    #logstash開的38383 port
    originRequest:
      noTLSVerify: true

  - hostname: across-candor.twister5.cf
    service: http://localhost:3000
  - service: http_status:404

```

### 用pm2啟動cf-tunnel
```
pm2 start /usr/bin/cloudflared --name cf-tunnel -- tunnel --config /etc/cloudflared/config.yml run across-prod
```

### 建立起 Routes DNS Record，建立完成後Cloudflare DNS頁面中會出現這個域名
```
cloudflared tunnel route dns across-prod across-candor.twister5.cf
cloudflared tunnel info across-prod // 檢查Tunnel狀況
```

---
