FROM node:latest

MAINTAINER andy99th <andy@99th.jp>

# Create user
RUN useradd -d /tedi -m -s /bin/bash -U tedi

# Change User and Directory
USER tedi
WORKDIR /tedi

# Download TediCross
RUN git clone https://github.com/TediCross/TediCross.git
WORKDIR /tedi/TediCross

# Install npm packege
RUN npm install

# Set Config Files
VOLUME ["/tedi/TediCross/settings.yaml"]

# Run TediCross
ENTRYPOINT ["npm"]
CMD ["start"]
