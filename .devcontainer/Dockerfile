ARG VARIANT="bionic"
FROM mcr.microsoft.com/vscode/devcontainers/base:${VARIANT} as base
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    git \
    software-properties-common \
    curl \
    jq
#Only necessary for use behind a corporate firewall
RUN curl -ksSL $(curl -ksSL $(curl -ksSL https://artifactory.wago.local/api/storage/certs-generic-prod-local/wago-intercept-certificates?lastModified | jq -r .'uri') | jq -r .'downloadUri') -o /usr/local/share/ca-certificates/wago.crt; exit 0
RUN update-ca-certificates

RUN add-apt-repository -y ppa:git-core/ppa 

RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash

RUN apt-get update && apt-get install -y \
    git-lfs \
    libncurses5-dev \
    gawk \
    flex \
    bison \
    texinfo \
    python-dev \
    g++ \
    dialog \
    libc6-dev \
    lzop \
    autoconf \
    libtool \
    xmlstarlet \
    xsltproc \
    doxygen \
    autopoint \
    python3-setuptools \
    wget \
    bzip2 \
    build-essential \
    gettext \
    bc \
    rsync \
    libelf-dev \
    && rm -rf /var/lib/apt/lists/*

RUN git lfs install
RUN git clone https://github.com/wago/gcc-toolchain-2019.12-precompiled.git /opt/gcc-Toolchain-2019.12/
RUN git clone https://github.com/wago/ptxdist.git /ptxdist

WORKDIR /ptxdist
RUN ./configure
RUN make
RUN make install
COPY resources /usr/bin/

FROM scratch as final
LABEL maintainer="dirk.meihoefer@wago.com, sergei.ikkert@wago.com"
COPY --from=base / /
USER vscode
WORKDIR /workspaces
ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "bash" ]
