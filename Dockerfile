FROM containers.ligo.org/docker/base:el7

LABEL name="LALSuite Development - Enterprise Linux 7" \
      maintainer="Adam Mercer <adam.mercer@ligo.org>" \
      support="Reference Platform"

# setup rpm macros
COPY /environment/.rpmmacros /root/.rpmmacros

# install development tools and git from IUS
RUN yum makecache && \
      yum groups mark convert && \
      yum -y groups install "Development Tools"

# install lalsuite dependencies
RUN yum -y install ccache \
      git-lfs \
      glue \
      ligo-gracedb \
      lscsoft-lalsuite-dev \
      rpmlint

# git-lfs post-install
RUN git lfs install

# clear package cache
RUN yum clean all
