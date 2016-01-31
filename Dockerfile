FROM ubuntu:14.04

RUN apt-get update && apt-get install -y \
    openjdk-7-jdk \
    unzip \
    zip \
    build-essential \
    mercurial

WORKDIR /tmp

RUN apt-get install -y \
    libX11-dev \
    libxext-dev \
    libxrender-dev \
    libxtst-dev \
    libxt-dev \
    libcups2-dev \
    libasound2-dev \
    pkg-config \
    libfreetype6-dev

RUN set -x \
    && hg clone http://hg.openjdk.java.net/jdk8u/jdk8u build \
    && cd build \
    && bash ./get_source.sh

RUN set -x \
    && cd build \
    && bash ./configure \
    && make all
