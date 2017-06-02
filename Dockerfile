FROM ligo/ligo-base:el7

LABEL name="LALSuite Development Enterprise Linux 7" \
      maintainer="Adam Mercer <adam.mercer@ligo.org>" \
      date="20170529" \
      support="Reference Platform"

RUN yum -y install lscsoft-lalsuite-dev \
      ccache
      glue
