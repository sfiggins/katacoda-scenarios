launch.sh

ssh node01 "
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
" >> /opt/katacoda-foreground.log 2>&1