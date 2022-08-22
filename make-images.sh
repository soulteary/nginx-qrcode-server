docker build -t soulteary/nginx-qrcode-server:2022.08.22 -f docker/Dockerfile .
docker build -t soulteary/nginx-qrcode-server -f docker/Dockerfile .

docker build -t soulteary/nginx-qrcode-server:memcached -f docker/Dockerfile.memcached .
docker build -t soulteary/nginx-qrcode-server:2022.08.22-memcached -f docker/Dockerfile.memcached .

docker push soulteary/nginx-qrcode-server:2022.08.22
docker push soulteary/nginx-qrcode-server
docker push soulteary/nginx-qrcode-server:2022.08.22-memcached
docker push soulteary/nginx-qrcode-server:memcached