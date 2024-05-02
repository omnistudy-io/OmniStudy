# Run db
docker build -t mysql/mysql-server .
docker run -dp 3306:3306 --name db --network omninet -e MYSQL_ROOT_PASSWORD=test mysql/mysql-server