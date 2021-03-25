#/bin/bash
echo "Waiting to install TensorFlow"; while [ ! -f /opt/.backgroundfinished ] ; do sleep 3;printf "."; done; echo "Completed Installation"

python3