FROM containers.ligo.org/docker/base:el7-testing

LABEL name="LALSuite Development - Enterprise Linux 7 - Testing" \
      maintainer="Adam Mercer <adam.mercer@ligo.org>" \
      support="Reference Platform"

# setup rpm macros
COPY /environment/.rpmmacros /root/.rpmmacros

# install development tools
RUN yum makecache && \
      yum groups mark convert && \
      yum -y groups install "Development Tools"

# install lalsuite dependencies
RUN yum -y install ccache \
      git-lfs \
      lscsoft-lalsuite-dev \
      python-ligo-lw \
      rpmlint

# git-lfs post-install
RUN git lfs install

# clear package cache
RUN yum clean all
