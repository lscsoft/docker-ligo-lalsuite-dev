FROM igwn/base:el7-testing

LABEL name="LALSuite Development - Enterprise Linux 7 - Testing"
LABEL maintainer="Adam Mercer <adam.mercer@ligo.org>"
LABEL support="Reference Platform"

# setup rpm macros
COPY /environment/.rpmmacros /root/.rpmmacros

# install development tools
RUN yum groups mark convert && \
    yum -y groups install "Development Tools" && \
    yum clean all

# install lalsuite dependencies
RUN yum -y install ccache \
      git-lfs \
      lscsoft-lalsuite-dev \
      python-ligo-lw \
      python3-ligo-lw \
      rpmlint && \
    yum clean all

# git-lfs post-install
RUN git lfs install
