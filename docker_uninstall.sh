#!/bin/bash
# Stop Docker
sudo systemctl stop docker

# Uninstall old versions
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove -y $pkg; done

sudo apt-get purge -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras

sudo apt -y autoremove
sudo apt -y autoclean
sudo apt-get clean

sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
sudo rm -rf /etc/docker
sudo rm -rf /var/run/docker*
sudo rm /etc/apt/keyrings/docker.asc
sudo rm /etc/apt/sources.list.d/docker.list
sudo rm /var/lib/apt/lists/download.docker.com_*

# Remove the docker group
sudo groupdel docker

echo "Removing Docker network interfaces..."
ip -o link show | awk -F': ' '{print $2}' | grep -E '^docker|^br-' | while read -r interface ; do
  sudo ip link delete "$interface"
done

for dir in /home/*/; do
        if [ -d "${dir}.docker" ]; then
                echo "Removing ${dir}.docker"
                sudo rm -rf "${dir}.docker"
        fi
done

sudo apt update
