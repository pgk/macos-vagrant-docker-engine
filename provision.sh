#!/usr/bin/env sh

# Install Docker

apt-get remove docker docker-engine docker.io containerd runc

apt-get update

apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release net-tools software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu focal stable' | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update

mkdir -p /etc/systemd/system/docker.service.d
mkdir -p /etc/docker

cat <<EOF | tee /etc/systemd/system/docker.service.d/docker.conf > /dev/null
[Service]
ExecStart=

ExecStart=/usr/bin/dockerd --containerd=/run/containerd/containerd.sock
EOF

cat <<EOF | tee /etc/docker/daemon.json > /dev/null
{

  "hosts": ["fd://", "tcp://0.0.0.0:2375"]

}
EOF


apt-get install -y docker-ce docker-ce-cli containerd.io


# Configure Docker to listen on a TCP socket

systemctl daemon-reload

systemctl restart docker.service
