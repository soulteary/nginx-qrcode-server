FROM soulteary/prebuilt-nginx-modules:ngx-1.23.1-qrcode-2022.08.21 AS Builder

FROM nginx:1.23.1

COPY --from=Builder /ngx_http_qrcode_module.so      /usr/local/nginx/modules/ngx_http_qrcode_module.so
COPY --from=Builder /usr/local/lib/libqrencode.a    /usr/local/lib/libqrencode.a
COPY --from=Builder /usr/local/bin/qrencode         /usr/local/bin/qrencode
COPY --from=Builder /usr/local/nginx/sbin/nginx     /usr/sbin/nginx

RUN mkdir -p /usr/local/nginx/ && \
    mkdir -p /usr/local/nginx/conf/ && \
    mkdir -p /usr/local/nginx/logs/ && \
    mv /etc/nginx/* /usr/local/nginx/conf/
COPY nginx.conf /usr/local/nginx/conf/nginx.conf
