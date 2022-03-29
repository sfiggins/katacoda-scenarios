#!/bin/bash

backgroundLog="/opt/katacoda-background.log"

while true; do 
  if ! grep "DoneDone" /opt/katacoda-finished &> /dev/null
  then
    sleep 1
  else
    break
  fi
done

echo "waiting for node01 to register" >> "${backgroundLog}"

while true; do
  if ! /usr/bin/kubectl get nodes | grep "node01         Ready" &> /dev/null
  then
    sleep 1
  else
    break
  fi
done

echo "breaking kubelet config.yaml" >> "${backgroundLog}"

ssh node01 << EOF >> "${backgroundLog}" 2>&1
echo 'wait for file'
until [ -f /var/lib/kubelet/config.yaml ]
do
  sleep 1
done
echo 'file exists; running sed'
sed -i 's#clientCAFile: /etc/kubernetes/pki/ca.crt#clientCAFile: /etc/kubernetes/pki/non-existent-ca.crt#g' /var/lib/kubelet/config.yaml
echo 'reloading daemon and restarting kubelet'
systemctl daemon-reload
systemctl restart kubelet
EOF

echo "done" >> "${backgroundLog}"