docker run -itd -v /opt/:/opt --name container1 centos:7
docker run -dt -v /opt/:/var/lib/mysql --name container2 -e MYSQL_ALLOW_EMPTY_PASSWORD=true mysql -e " -h "127.0.0.1" -u "root" < "/opt/db.sql""
docker exec -idt container2 mysql bash -h "127.0.0.1" -u "root" < "/opt/db.sql"
docker exec -idt container2 mysql bash -h "127.0.0.1" -u "root" < "/opt/tb.sql"
docker exec -idt container2 mysql bash -h "127.0.0.1" -u "root" < "/opt/insert.sql"
docker run -idt -v /opt/:/var/lib/mysql --name container3 -e MYSQL_ALLOW_EMPTY_PASSWORD=true mysql
