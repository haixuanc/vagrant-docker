# -----------------------------------------------------------------------------
# Install Docker
# -----------------------------------------------------------------------------

which wget
if [ $? -eq 1 ]; then
	sudo apt-get update && sudo apt-get install wget
fi
wget -qO- https://get.docker.com | sh

# Add user `vagrant` to `docker` user group, so you don't need to sudo docker
# commands
sudo usermod -aG docker vagrant

sudo -u vagrant docker run hello-world && STATUS=$?
echo "------------------------------------------------------------------------"
if [ $STATUS -eq 0 ]; then 
	echo -e "Docker installed successfully"
else
	echo -e "Failed to install Docker"
fi
echo "------------------------------------------------------------------------"

# -----------------------------------------------------------------------------
# Install Docker-compose
# -----------------------------------------------------------------------------

which curl
if [ $? -eq 1 ];then
	sudo apt-get update && sudo apt-get install curl
fi

curl -L https://github.com/docker/compose/releases/download/1.1.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# [OPTIONAL] Install `docker-compose` command completion
curl -L https://raw.githubusercontent.com/docker/compose/1.10/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose

docker-compose --version && STATUS=$?
echo "------------------------------------------------------------------------"
if [ $STATUS -eq 0 ]; then
	echo -e "Docker-compose installed successfully"
else
	echo -e "Failed to install Docker-compose"
fi
echo "------------------------------------------------------------------------"

# -----------------------------------------------------------------------------
# Install NodeJS
# -----------------------------------------------------------------------------

curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install -y nodejs

# [OPTIONAL] Install build tools to compile and install addons from npm
sudo apt-get install -y build-essential

npm --version && STATUS=$?
echo "------------------------------------------------------------------------"
if [ $STATUS -eq 0 ]; then
	echo -e "NodeJS installed successfully"
else
	echo -e "Failed to install NodeJS"
fi
echo "------------------------------------------------------------------------"
