FROM ligo/ligo-base:el7

LABEL name="LALSuite Development Enterprise Linux 7" \
      maintainer="Adam Mercer <adam.mercer@ligo.org>"

RUN yum -y install lscsoft-lalsuite-dev \
      glue
