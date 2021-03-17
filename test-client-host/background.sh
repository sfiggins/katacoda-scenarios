#!/usr/bin/env bash

# wait for asset to show up
until [ -x /root/run_server.sh ]
 do sleep 1
done

ssh root@host01 bash -s < /root/run_server.sh
