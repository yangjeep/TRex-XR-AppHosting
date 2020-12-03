FROM ubuntu:20.04
RUN apt-get update
RUN apt-get -y install python \
             wget \
             bash \
             net-tools \
             netbase \
             strace \
             iproute2 \
             iputils-ping \
             pciutils \
             vim
RUN mkdir /trex && \
    cd /trex && \
    wget http://trex-tgn.cisco.com/trex/release/latest && \
    mv latest latest.tar.gz && \
    mkdir trex-tgn && \
    tar -zxvf latest.tar.gz -C trex-tgn --strip-components 1 && \
    chown root:root /trex-tgn  && \
    rm latest.tar.gz && \
    cd /trex && \
    wget https://aastha.cisco.com:9005/routem/releases/package/latest.tar.gz && \
    mkdir trex-iol && \
    tar -zxvf latest.tar.gz -C trex-iol --strip-components 1 && \
    chown root:root /trex-tgn  && \
    rm latest.tar.gz

#COPY trex_cfg_cat9k.yaml /etc/trex_cfg_cat9k.yaml
WORKDIR /trex

CMD tail -f /dev/null
#CMD ["./t-rex-64", "-i"]
#CMD ["./t-rex-64", "-i", "--cfg", "/etc/trex_cfg_cat9k.yaml"]
