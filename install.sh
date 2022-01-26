#!/usr/bin/env sh

# Install VirtualBox
grep '^192.168.56.4 docker.local' /etc/hosts || {
  echo Adding entry to /etc/hosts
  # Save IP to a hostname

  echo "192.168.56.4 docker.local" | sudo tee -a /etc/hosts > /dev/null
}

brew install --cask virtualbox

brew install --cask virtualbox-extension-pack


# Install Vagrant and the vbguest plugin to manage VirtualBox Guest Additions on the VM

brew install vagrant

vagrant plugin install vagrant-vbguest


# Install Docker CLI

brew install docker

brew install docker-compose

echo 'add this to your rc file: export DOCKER_HOST=tcp://docker.local:2375'

# also running this now in case we want to run docker right now.
export DOCKER_HOST=tcp://docker.local:2375

