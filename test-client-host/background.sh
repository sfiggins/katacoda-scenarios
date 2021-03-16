#!/usr/bin/env bash
ssh root@host01 <<EOF
nohup bash -c "until [ -x /usr/local/bin/run_server.sh ]; do sleep 1; done; /usr/local/bin/run_server.sh" > /tmp/run_server.out 2>&1 &
EOF
