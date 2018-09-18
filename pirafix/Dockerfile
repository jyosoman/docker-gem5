FROM ubuntu:14.04
MAINTAINER Jyothish Soman <jyothish.soman@gmail.com>

# get dependencies
RUN apt-get update
RUN apt-get install -y build-essential git-core m4 scons zlib1g zlib1g-dev libprotobuf-dev protobuf-compiler libprotoc-dev libgoogle-perftools-dev swig python-dev python
RUN apt-get clean

# checkout repo with mercurial
WORKDIR /usr/local/src
RUN hg clone http://repo.gem5.org/gem5; cd gem5
RUN hg update -r 11115
RUN patch -p1 pirafix.patch
# build it
WORKDIR /usr/local/src/gem5
RUN git checkout b5bb2a25aa702ad3d1a173e9e86d2addc24d9c13
RUN git patch repair.diff
ADD build.bash /usr/local/src/gem5/build.bash
RUN chmod ugo+x build.bash
RUN ./build.bash
ENTRYPOINT bash
