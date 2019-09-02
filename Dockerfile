FROM containers.ligo.org/docker/base:stretch-proposed

LABEL name="LALSuite Development - Debian Stretch - Proposed" \
      maintainer="Adam Mercer <adam.mercer@ligo.org>" \
      support="Reference Platform"

# install lalsuite-dependencies
RUN apt-get update && apt-get --assume-yes install \
      build-essential \
      ccache \
      devscripts \
      git-lfs \
      help2man \
      lscsoft-lalsuite-dev \
      python-all-dev \
      python-ligo-gracedb \
      python3-all-dev \
      python3-ligo-gracedb \
      swig3.0

# git-lfs post-install
RUN git lfs install

# clear package cache
RUN rm -rf /var/lib/apt/lists/*
