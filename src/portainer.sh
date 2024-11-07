# Update packages
sudo apt update && sudo apt upgrade -y

# Docker
## Install prerequisites
sudo apt install apt-transport-https ca-certificates curl software-properties-common

## Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

## Add Docker APT repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

## Install Docker
sudo apt update
sudo apt install docker-ce

## Start and enable Docker
sudo systemctl start docker
sudo systemctl enable docker

## Confirm Docker instalation
docker --version

# Portainer
## Pull the Portainer image
docker pull portainer/portainer-ce

## Create a Docker volume for Portainer data
docker volume create portainer_data

## Run Portainer on Docker
docker run -d -p 8000:8000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
