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
RUN wget http://trex-tgn.cisco.com/trex/release/latest && \
    mv latest latest.tar.gz && \
    mkdir trex-latest && \
    tar -zxvf latest.tar.gz -C trex-latest --strip-components 1 && \
    chown root:root /trex-latest  && \
    rm latest.tar.gz
#COPY trex_cfg_cat9k.yaml /etc/trex_cfg_cat9k.yaml
WORKDIR /trex-latest
CMD tail -f /dev/null
#CMD ["./t-rex-64", "-i"]
#CMD ["./t-rex-64", "-i", "--cfg", "/etc/trex_cfg_cat9k.yaml"]
