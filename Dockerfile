FROM nginx:1.19.6-alpine

ARG NGINX_VERSION=1.19.6
ARG LIBQR_VERSION=4.1.1
ARG NGX_LIBQR_VERSION=20210106

RUN apk add --no-cache --virtual .build-deps gcc libc-dev make openssl-dev pcre-dev zlib-dev linux-headers libxslt-dev gd-dev geoip-dev perl-dev libedit-dev mercurial bash alpine-sdk findutils && \
    apk add --no-cache --virtual .build-qrcode openssl-dev pcre-dev zlib-dev build-base autoconf automake libtool libpng-dev libgd pcre pcre-dev pkgconfig gd-dev && \
    mkdir -p /usr/src && cd /usr/src && \
    curl -L https://github.com/fukuchi/libqrencode/archive/v${LIBQR_VERSION}.tar.gz -o "v${LIBQR_VERSION}.tar.gz" && \
    tar -zxC /usr/src -f v${LIBQR_VERSION}.tar.gz && \
    cd /usr/src/libqrencode-4.1.1 && ./autogen.sh && LDFLAGS=-lgd ./configure && make && make install && cd /usr/src && \
    curl -L "http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz" -o nginx.tar.gz && \
    curl -L "https://github.com/soulteary/ngx_http_qrcode_module/archive/${NGX_LIBQR_VERSION}.tar.gz" -o ${NGX_LIBQR_VERSION}.tar.gz && \
    tar zxvf ${NGX_LIBQR_VERSION}.tar.gz && mv ngx_http_qrcode_module-${NGX_LIBQR_VERSION} ngx_http_qrcode_module && \
    tar -zxC /usr/src -f nginx.tar.gz && \
    cd /usr/src/nginx-$NGINX_VERSION && \
    CONFARGS=$(nginx -V 2>&1 | sed -n -e 's/^.*arguments: //p') \
    CONFARGS=${CONFARGS/-Os -fomit-frame-pointer/-Os} && \
    echo $CONFARGS && \
    ./configure --with-compat $CONFARGS --add-module=../ngx_http_qrcode_module/ && \
    make && make install && \
    apk del .build-deps .build-qrcode && \
    rm -rf /tmp/* && rm -rf /var/cache/apk/* && rm -rf /usr/src/ && \
    curl -L https://raw.githubusercontent.com/soulteary/ngx_http_qrcode_module/master/conf/nginx.conf -o /etc/nginx/nginx.conf
