FROM soulteary/prebuilt-nginx-modules:ngx-1.21.1-qrcode-master-alpine AS Builder

FROM nginx:1.21.0-alpine

COPY --from=Builder /nginx                      /usr/sbin/nginx
COPY --from=Builder /libqrencode.so.4.1.1       /usr/local/lib/libqrencode.so.4
COPY --from=Builder /ngx_http_qrcode_module.so  /etc/nginx/modules/ngx_http_qrcode_module.so

RUN curl -L https://github.com/nginx-with-docker/ngx_http_qrcode_module/raw/main/nginx.conf -o /etc/nginx/nginx.conf
