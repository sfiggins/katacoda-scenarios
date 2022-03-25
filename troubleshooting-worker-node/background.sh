#!/bin/bash

while true; do 
  grep "DoneDone" /opt/katacoda-finished &> /dev/null
  if [[ "$?" -ne 0 ]]; then
    sleep 1
  else
    break
  fi
done

ssh node01 "
until [ -f /var/lib/kubelet/config.yaml ]
do
  sleep 1
done
sed -i 's/clientCAFile: \/etc\/kubernetes\/pki\/ca.crt/clientCAFile: \/etc\/kubernetes\/pki\/non-existent-ca.crt/g' /var/lib/kubelet/config.yaml
systemctl daemon-reload
systemctl restart kubelet
"