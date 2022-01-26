# MacOS use docker through Vagrant

No need for licensing Docker.app. This will install VirtualBox, Vagrant and docker on
your macos, and provision a machine for hosting docker. Adapted from [this](https://dhwaneetbhatt.com/blog/run-docker-without-docker-desktop-on-macos/)

```bash
./install.sh
vagrant up --provision
export DOCKER_HOST=tcp://docker.local:2375
docker run hello-docker
```
