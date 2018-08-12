FROM ubuntu:xenial
MAINTAINER jiudianren   <648087012@qq.com>

ENV DEBIAN_FRONTEND noninteractive
WORKDIR /usr/include/
# We pass the boost version argument as argument
ARG BOOST_VERSION=1.67.0
ARG BOOST_VERSION_=1_67_0

ENV BOOST_VERSION=${BOOST_VERSION}
ENV BOOST_VERSION_=${BOOST_VERSION_}
ENV BOOST_ROOT=/usr/include/boost

RUN apt-get -qq update && apt-get install -q -y software-properties-common python-software-properties
RUN add-apt-repository ppa:ubuntu-toolchain-r/test -y
RUN apt-get -qq update && apt-get install -qy g++-6 gcc git wget
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-6 90

RUN wget --no-check-certificate --max-redirect 3 https://sourceforge.net/projects/boost/files/boost/${BOOST_VERSION}/boost_${BOOST_VERSION_}.tar.gz \
    && mkdir -p /home/boost  \
    && tar zxf boost_${BOOST_VERSION_}.tar.gz -C /home/boost --strip-components=1  \
    && rm  /usr/include/boost_${BOOST_VERSION_}.tar.gz \
    && cd /    \
    && find . -name b2 \
    && echo "one1"  \
    && bash /home/boost/bootstrap.sh --prefix=/usr --exec-prefix=/usr \
    && cd /   \
    && find . -name b2 \
    && echo "one2" \
    && ls  /home/boost/   \
    && chmod +x /home/boost/b2 \ 
    && file /home/boost/b2 \
    && /home/boost/tools/build/src/engine/bin.linuxx86_64/b2 install \
    && rm -rf /home/boost



ENTRYPOINT /bin/bash