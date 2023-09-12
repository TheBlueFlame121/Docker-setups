FROM ubuntu:jammy

ARG DEBIAN_FRONTEND=noninteractive

USER root

SHELL [ "/bin/bash", "-c" ]

RUN apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    apt update && \
    apt upgrade -y

RUN apt install -y bc binutils bzip2 ca-certificates cliquer cmake curl ecl eclib-tools \
    fflas-ffpack flintqs g++ gengetopt gfan gfortran git glpk-utils gmp-ecm lcalc \
    libatomic-ops-dev libboost-dev libbraiding-dev libbrial-dev libbrial-groebner-dev \
    libbz2-dev libcdd-dev libcdd-tools libcliquer-dev libcurl4-openssl-dev libec-dev \
    libecm-dev libffi-dev libflint-arb-dev libflint-dev libfreetype6-dev libgc-dev \
    libgd-dev libgf2x-dev libgiac-dev libgivaro-dev libglpk-dev libgmp-dev libgsl-dev \
    libhomfly-dev libiml-dev liblfunction-dev liblrcalc-dev liblzma-dev libm4rie-dev \
    libmpc-dev libmpfi-dev libmpfr-dev libncurses5-dev libntl-dev libopenblas-dev \
    libpari-dev libpcre3-dev libplanarity-dev libppl-dev libprimesieve-dev \
    libpython3-dev libqhull-dev libreadline-dev librw-dev libsingular4-dev \
    libsqlite3-dev libssl-dev libsuitesparse-dev libsymmetrica2-dev libz-dev \
    libzmq3-dev libzn-poly-dev m4 make nauty openssl palp pari-doc pari-elldata \
    pari-galdata pari-galpol pari-gp2c pari-seadata patch perl pkg-config planarity \
    ppl-dev python3-distutils python3-venv r-base-dev r-cran-lattice singular sqlite3 \
    sympow tachyon tar tox xcas xz-utils 

RUN apt install -y wget git ranger neofetch vim htop apt-utils \
    software-properties-common python3 python3-pip unzip build-essential automake m4 \
    dpkg-dev rdfind 

RUN pip install pwntools tqdm

RUN apt install sudo && groupadd noroot && \
    useradd -s /bin/bash -m -g noroot noroot && \
    usermod -aG sudo noroot && \
    echo "noroot ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER noroot
WORKDIR /home/noroot/

RUN git clone --branch master https://github.com/sagemath/sage.git
RUN cd sage && \
    make configure && \
    ./configure && \
    MAKE="make -j8" make

RUN sudo ln -sf $(pwd)/sage/sage /usr/local/bin

