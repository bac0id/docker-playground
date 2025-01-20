nohup dockerd &

echo "sleep 10"
sleep 10

service docker stop
service docker start

docker pull portainer/portainer-ce

docker volume create portainer_data

docker run -d -p 8000:8000 -p 9443:9443 -p 9000:9000 \
    --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce

#python3 /app/app.py
