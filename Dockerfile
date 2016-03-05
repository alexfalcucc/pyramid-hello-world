############################################################
# Dockerfile to build a simple hello world container image.
# Based on Ubuntu
############################################################

from        ubuntu
MAINTAINER  Alexsander Falcucci
RUN \
  apt-get update && \
  apt-get install -y python python-dev python-pip python-virtualenv && \
  rm -rf /var/lib/apt/lists/*
RUN         apt-get update
ADD         /pyramid-hello-world /pyramid-hello-world
WORKDIR     /pyramid-hello-world
RUN python setup.py develop
EXPOSE 6543
CMD ['pserve', 'development.ini', '--reload']
