# High Performance Nginx Qrcode Server

High Performance QR Code Server with Nginx, Close to the size of the official Nginx Docker Image (~ 55MB).

![](./assets/dockerhub.png)

## Quick Start

```bash
docker run --rm -it -p 8080:80 soulteary/nginx-qrcode-server
```

open browser, visit `localhost:8080`

## Benchmark

Tested with a AMD Zen2 laptop (R7-4750u)

single core: (limit nginx with `worker_processes 1`)

```bash
Running 30s test @ http://10.11.12.240:8080
  16 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   196.91ms   28.21ms 288.56ms   78.55%
    Req/Sec    30.43     12.31    60.00     74.05%
  14589 requests in 30.10s, 10.11MB read
Requests/sec:    484.61
Transfer/sec:    344.05KB
```

8 cores 16 threads: (limit nginx with `worker_processes auto`)

```bash
Running 30s test @ http://10.11.12.240:8080
  16 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    32.29ms   22.70ms 156.43ms   83.76%
    Req/Sec   204.13     74.04   390.00     64.94%
  97811 requests in 30.10s, 67.81MB read
Requests/sec:   3249.91
Transfer/sec:      2.25MB
```

## Resources

- Docker Pre-built: https://github.com/soulteary/ngx_http_qrcode_module
- QR-Encode Lib: https://github.com/fukuchi/libqrencode
- Docker Nginx Dev Env: https://github.com/nginx-with-docker/nginx-docker-playground
