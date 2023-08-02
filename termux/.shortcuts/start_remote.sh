#/bin/bash

USERNAME=$(id -u -n)
LOCAL_IP=$(ifconfig 2>/dev/null | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')

echo "To connect remotely use the following command."
echo "ssh $USERNAME@$LOCAL_IP -p 8022 -x -C"

sshd -D
