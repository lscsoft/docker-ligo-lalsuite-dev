FROM igwn/base:buster

LABEL name="LALSuite Development - Debian Buster" \
      maintainer="Adam Mercer <adam.mercer@ligo.org>" \
      support="Unsupported"

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
