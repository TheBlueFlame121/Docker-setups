FROM ubuntu:jammy

ARG DEBIAN_FRONTEND=noninteractive

USER root

SHELL [ "/bin/bash", "-c" ]

RUN apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    apt update && \
    apt upgrade -y

RUN apt install -y binutils cmake curl flintqs g++ git libflint-arb-dev libflint-dev \
    libgmp-dev libmpfr-dev libqd-dev autoconf libtool pkg-config

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
    git clone https://github.com/fplll/fpylll && \
    cd fpylll && \
    pip install -r requirements.txt && \
    pip install -r suggestions.txt && \
    python setup.py clean && \
    python setup.py build_ext -j 4 && \
    python setup.py install

RUN cd /home/noroot && \
    git clone https://github.com/fplll/g6k && \
    cd g6k && \
    pip install -r requirements.txt && \
    python setup.py clean && \
    python setup.py build_ext -j 4 && \
    make clean && \
    ./configure --with-max-sieving-dim=512 && \
    python setup.py build_ext -j 4 && \
    python setup.py install

USER noroot

WORKDIR /home/noroot/
