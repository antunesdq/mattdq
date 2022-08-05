docker rm -f $(sudo docker ps -a -q)
docker rmi $(sudo docker images -q)
docker build --tag mattdq:latest .
docker run --name mattdq -d -p 8000:8000 mattdq:latest
