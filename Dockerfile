FROM ligo/base:sl7

LABEL name="LALSuite Development - Scientific Linux 7" \
      maintainer="Adam Mercer <adam.mercer@ligo.org>" \
      date="20180611" \
      support="Reference Platform"

COPY /environment/.rpmmacros /root/.rpmmacros

# install development tools and git from IUS
RUN yum makecache && \
      yum groups mark convert && \
      yum -y groups install "Development Tools" && \
      yum -y remove git && \
      yum -y install git2u

# install lalsuite dependencies
RUN yum -y install ccache \
      glue \
      ligo-gracedb \
      lscsoft-lalsuite-dev \
      rpmlint

# git-lfs post-install
RUN git lfs install

# clear package cache
RUN yum clean all
