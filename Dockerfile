FROM debian:wheezy

RUN apt-get update && \
    TERM=vt100 DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
    install apt-utils ca-certificates wget git

RUN wget -qO - https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz | tar xzf - -C /usr/local

RUN echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile

RUN cd /root; GOPATH=/root /usr/local/go/bin/go get github.com/calavera/docker-volume-glusterfs
