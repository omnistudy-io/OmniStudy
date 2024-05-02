# Create network
docker network rm omninet
docker network create omninet

# Run ai
cd ai && docker/dev.sh && cd ..
echo "After AI: $(pwd)"

# Run api
cd api && docker/dev.sh && cd ..
echo "After API: $(pwd)"

# Run db
docker build -t mysql/mysql-server .
docker run -dp 3306:3306 --name db --network omninet -e MYSQL_ROOT_PASSWORD=test mysql/mysql-server
echo "After DB: $(pwd)"

# Run web
cd web && docker/dev.sh && cd ..
echo "After WEB: $(pwd)"
