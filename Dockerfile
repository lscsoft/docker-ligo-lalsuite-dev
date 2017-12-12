FROM ligo/base:el7

LABEL name="LALSuite Development Enterprise Linux 7" \
      maintainer="Adam Mercer <adam.mercer@ligo.org>" \
      date="20170606" \
      support="Reference Platform"

# install development tools and git from IUS
RUN yum makecache && \
      yum groups mark convert && \
      yum -y groups install "Development Tools" && \
      yum -y remove git && \
      yum -y install git2u

# install lalsuite dependencies
RUN yum -y install ccache \
      glue \
      lscsoft-lalsuite-dev

# clear package cache
RUN yum clean all
