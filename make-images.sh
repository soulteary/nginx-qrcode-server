docker build -t soulteary/nginx-qrcode-server:2022.08.21 -f Dockerfile .
docker build -t soulteary/nginx-qrcode-server -f Dockerfile .

docker build -t soulteary/nginx-qrcode-server:memcached -f Dockerfile.memcached .
docker build -t soulteary/nginx-qrcode-server:2022.08.21-memcached -f Dockerfile.memcached .