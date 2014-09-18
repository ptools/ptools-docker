FROM debian:testing
MAINTAINER adrien.saladin@gmail.com

RUN apt-get update
RUN apt-get -y install python-dev git
RUN git clone https://github.com/ptools/ptools
RUN apt-get -y install python-pip cython
WORKDIR ptools
RUN sh install-deps.sh
RUN python setup.py install
RUN mkdir /root/test
WORKDIR /root/test
ADD files/ /root/test
