docker build -t soulteary/nginx-qrcode-server:2022.08.21 -f docker/Dockerfile .
docker build -t soulteary/nginx-qrcode-server -f docker/Dockerfile .

docker build -t soulteary/nginx-qrcode-server:memcached -f docker/Dockerfile.memcached .
docker build -t soulteary/nginx-qrcode-server:2022.08.21-memcached -f docker/Dockerfile.memcached .

docker push soulteary/nginx-qrcode-server:2022.08.21
docker push soulteary/nginx-qrcode-server
docker push soulteary/nginx-qrcode-server:2022.08.21-memcached
docker push soulteary/nginx-qrcode-server:memcached