#!/bin/bash
echo "nameserver 178.22.122.100" > /etc/resolv.conf
echo "nameserver  185.51.200.2" >> /etc/resolv.conf

yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine -y


yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2


yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce docker-ce-cli containerd.io
systemctl start docker
systemctl enable docker
systemctl status docker
docker -v


curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
