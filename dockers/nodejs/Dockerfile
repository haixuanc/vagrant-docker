FROM dockerfile/ubuntu

MAINTAINER Haixuan Chen

# Install NPM
RUN \
  curl -sL https://deb.nodesource.com/setup | sudo bash - && \
  sudo apt-get install -y nodejs

# [OPTIONAL] Install build tools to compile and install addons from npm
RUN sudo apt-get install -y build-essential

# Verify if installed
RUN \
  npm --version && STATUS=$? && \
  echo "------------------------------------------------------------------------" && \
  if [ $STATUS -eq 0 ]; then echo "NodeJS installed successfully"; \
  else echo "Failed to install NodeJS"; \
  fi && \
  echo "------------------------------------------------------------------------"
