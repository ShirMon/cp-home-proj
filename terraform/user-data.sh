#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install -y docker
sudo systemctl enable docker
sudo systemctl start docker
sudo docker pull postgres
sudo docker pull shirmon/cppythonexam:1
export MYTMPPWORD=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13)
sudo docker run -d --name postgres -p 127.0.0.1:5432:5432 -e POSTGRES_PASSWORD=$(echo $MYTMPPWORD) -e POSTGRES_USER=user1 postgres
sleep 10
sudo docker exec postgres psql --user user1 -c "CREATE DATABASE testdb;"
sudo docker run -d -it --network host --name djangoapp -e POSTGRES_PASSWORD=$(echo $MYTMPPWORD) -e PG_DB_HOST=localhost shirmon/cppythonexam:1
export MYTMPPWORD=""
sleep 10
sudo docker exec djangoapp python manage.py makemigrations
sudo docker exec djangoapp python manage.py migrate