# wait for asset to show up
until [ -f /root/docker-compose.yml ]
 do sleep 1
done

docker-compose -f /root/docker-compose.yml up -d > /tmp/ssh-dc.log
