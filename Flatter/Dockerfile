FROM ubuntu:jammy

ARG DEBIAN_FRONTEND=noninteractive

USER root

SHELL [ "/bin/bash", "-c" ]

RUN apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    apt update && \
    apt upgrade -y

RUN apt install -y build-essential binutils cmake curl flintqs g++ git libflint-arb-dev \
    libflint-dev libgmp-dev libmpfr-dev libqd-dev libeigen3-dev autoconf libtool \
    pkg-config libopenblas-dev

RUN apt install -y wget git ranger neofetch vim htop apt-utils \
    software-properties-common python3 python3-pip python-is-python3

RUN pip install pwntools tqdm virtualenv

RUN apt install sudo && groupadd noroot && \
    useradd -s /bin/bash -m -g noroot noroot && \
    usermod -aG sudo noroot && \
    echo "noroot ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN cd /home/noroot && \
    git clone https://github.com/fplll/fplll && \
    cd fplll && \
    ./autogen.sh && \
    ./configure && \
    make clean && \
    make -j 4 && \
    make install

RUN /sbin/ldconfig

RUN cd /home/noroot && \
    git clone https://github.com/keeganryan/flatter && \
    mkdir flatter/build && \
    cd flatter/build && \
    cmake .. && \
    make && \
    make install

RUN /sbin/ldconfig

USER noroot

WORKDIR /home/noroot/
