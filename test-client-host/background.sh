# wait for asset to show up
until [ -f /root/docker-compose.yml ]
 do sleep 1
done

ssh root@host01 /usr/local/bin/docker-compose -f - up -d < /root/docker-compose.yml > /tmp/ssh-dc.log
