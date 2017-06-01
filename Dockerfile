FROM ligo/ligo-base:jessie

LABEL name="LALSuite Development Debian Jessie" \
      maintainer="Adam Mercer <adam.mercer@ligo.org>" \
      date="20170529" \
      support="Reference Platform"

# FIXME: this should use the lscsoft-lalsuite-dev meta-package but
# that is out of date on Debian and needs to be updated
RUN apt-get update && apt-get --assume-yes install autoconf \
      apt-transport-https \
      automake \
      bc \
      ca-certificates \
      curl \
      doxygen \
      gettext \
      gnupg2 \
      help2man \
      ldas-tools-framecpp-c-dev \
      libcfitsio-dev \
      libchealpix-dev \
      libfftw3-dev \
      libframe-dev \
      libglib2.0-dev \
      libgsl0-dev \
      libhdf5-dev \
      libmetaio-dev \
      liboctave-dev \
      libopenmpi-dev \
      libtool \
      libxml2-dev \
      pkg-config \
      python-dev \
      python-glue \
      python-h5py \
      python-healpy \
      python-numpy \
      python-scipy \
      python-shapely \
      python-six \
      software-properties-common \
      swig3.0 \
      texlive && \
      rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/debian \
      $(lsb_release -cs) \
      stable"

ENV DOCKER_VERSION ""
RUN apt-get update && \
    apt-get -y install docker-ce=$(apt-cache show docker-ce | grep 'Version:' | awk '{print $NF}' | grep "$DOCKER_VERSION" | head -n 1) && \
    rm -rf /var/lib/apt/lists/*
