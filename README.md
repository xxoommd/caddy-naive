# TAG说明
- latest：无cloudflare
- cf：使用cloudflare作为上游服务器

# 前置条件
1. 设置DNS，保证域名解析正确

2. 服务器允许80和443访问

3. 提供Caddyfile

Caddyfile示例：
```Caddyfile
:443, nv.example.com
tls helloworld@nv.example.com
  route {
    forward_proxy {
    basic_auth USERNAME PASSWORD
    hide_ip
    hide_via
    probe_resistance
    # upstream socks5://127.0.0.1:40000 容器内warp-svc默认为40000端口
  }
  respond nv.example.com!
}
```
# Usage：

1.直接运行

```docker run --name caddy --network=host -v $PWD/Caddyfile:/Caddyfile caddy-naive```

2.Docker compose示例

```yaml
services:
  caddy:
    image: caddy-naive:cf-latest
    container_name: caddy
    volumes:
      - $PWD/Caddyfile:/Caddyfile
    network_mode: "host"
```
