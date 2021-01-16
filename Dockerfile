FROM igwn/base:stretch

LABEL name="LALSuite Development - Debian Stretch"
LABEL maintainer="Adam Mercer <adam.mercer@ligo.org>"
LABEL support="Reference Platform"

# install lalsuite-dependencies
RUN apt-get update && \
    apt-get --assume-yes install \
      build-essential \
      ccache \
      devscripts \
      git-lfs \
      lscsoft-lalsuite-dev \
      python-ligo-lw \
      python3-ligo-lw && \
    apt-get clean

# git-lfs post-install
RUN git lfs install
