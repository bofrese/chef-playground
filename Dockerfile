# Use the latest Ubuntu image as the base image
# Force platform so it works on Mac M1/M2 (chef not supported on ARC64)
FROM --platform=linux/amd64 ubuntu:latest

# Set the environment variables
ENV CHEF_LICENSE=accept-no-persist

# Install Chef Development Kit
RUN apt-get update && \
    apt-get install wget -y && \
    wget https://packages.chef.io/files/stable/chef-workstation/21.10.640/ubuntu/20.04/chef-workstation_21.10.640-1_amd64.deb && \
    dpkg -i chef-workstation_21.10.640-1_amd64.deb

# Install aditional packages
RUN apt-get install -y sudo vim locales make docker.io
# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Set the working directory to /chef
WORKDIR /chef
RUN     useradd --shell /bin/bash -M  -d /chef -U -G sudo -p '' chef
USER    chef
ENV     CHEF_LICENSE=accept-no-persist

# Keep it running
ENTRYPOINT ["tail", "-f", "/dev/null"]

