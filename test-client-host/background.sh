#!/usr/bin/env bash
ssh root@host01 'until [ -x /usr/local/bin/run_server.sh ]; do sleep 1; done; /usr/local/bin/run_server.sh'
