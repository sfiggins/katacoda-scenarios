#!/bin/bash
set -v

while true; do 
  if ! grep "DoneDone" /opt/katacoda-finished &> /dev/null
  then
    sleep 1
  else
    break
  fi
done

ssh node01 << EOF >> /opt/katacoda-background.log 2>&1
echo 'wait for file'
until [ -f /var/lib/kubelet/config.yaml ]
do
  sleep 1
done
echo 'file exists; running sed'
sed -i 's/clientCAFile: \/etc\/kubernetes\/pki\/ca.crt/clientCAFile: \/etc\/kubernetes\/pki\/non-existent-ca.crt/g' /var/lib/kubelet/config.yaml
echo 'reloading daemon and restarting kubelet'
systemctl daemon-reload
systemctl restart kubelet
EOF