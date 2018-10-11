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
RUN apt-get install -y python-dev &&  apt-get install -y zlib1g-dev && apt-get install -y openssl && apt-get install -y libssl-dev && apt-get clean


#./bootstrap.sh
#./bjam stage 
#  --with-iostreams 
#   --with-log define=BOOST_LOG_USE_STD_REGEX define=BOOST_LOG_WITHOUT_WCHAR_T 
#  --with-system 
#  --with-date_time 
#  --with-filesystem 
#   link=shared 
#   runtime-link=shared 
#   threading=multi 
#    variant=debug 
#-s ZLIB_SOURCE="/home/AAA/temp/zlib-1.2.11" -s ZLIB_INCLUDE="/home/AAA/temp/zlib-1.2.11"
#最后一步指定 zlib ，如果zlib是自动以安装的话

RUN mkdir -p /home/boost
#download to workdir 
WORKDIR /home/boost
RUN wget --no-check-certificate --max-redirect 3 https://sourceforge.net/projects/boost/files/boost/${BOOST_VERSION}/boost_${BOOST_VERSION_}.tar.gz \
    && tar zxf boost_${BOOST_VERSION_}.tar.gz -C /home/boost --strip-components=1  \
    && rm  /home/boost/boost_${BOOST_VERSION_}.tar.gz \
    && cd /    \
    && find . -name b2 \
    && echo "one1"  \
    && cd /home/boost   \
    && bash /home/boost/bootstrap.sh --prefix=/usr --exec-prefix=/usr \
    && cd /   \
    && find . -name b2 \
    && echo "one2" \
    && ls  /home/boost/   \
    && cd /home/boost   \
    && /home/boost/b2  install \
    && rm -rf /home/boost



ENTRYPOINT /bin/bash