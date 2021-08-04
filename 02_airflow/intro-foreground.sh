#!/bin/bash
wget -qO - https://raw.githubusercontent.com/yarnpkg/releases/gh-pages/debian/pubkey.gpg | sudo apt-key add - \
&& apt update \
&& export AIRFLOW__WEBSERVER__WORKER_REFRESH_BATCH_SIZE=0 \
&& export AIRFLOW__WEBSERVER__WORKER_REFRESH_INTERVAL=0 \
&& export AIRFLOW__WEBSERVER__WORKERS=2 \
&& clear \
&& echo "Setup complete!"