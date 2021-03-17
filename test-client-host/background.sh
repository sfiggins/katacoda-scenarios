#!/usr/bin/env bash

# wait for asset to show up
until [ -x /root/docker-compose.yml ]
 do sleep 1
done

ssh root@host01 /usr/local/bin/docker-compose -d < /root/docker-compose.yml > /tmp/ssh-dc.log
