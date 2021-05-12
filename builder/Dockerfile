FROM ubuntu:18.04

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y apt-utils
RUN apt-get install -y build-essential
RUN apt-get install -y git
RUN apt-get install -y cmake
RUN apt-get install -y libtbb-dev
RUN apt-get install -y openssl
RUN apt-get install -y libssl-dev
RUN apt-get install -y libace-dev
RUN apt-get install -y p7zip-full 
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y libmysqlclient-dev
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y ccache

RUN ln -s /usr/bin/ccache /usr/local/bin/gcc 
RUN ln -s /usr/bin/ccache /usr/local/bin/g++
RUN ln -s /usr/bin/ccache /usr/local/bin/cc
RUN ln -s /usr/bin/ccache /usr/local/bin/c++

ENV ACE_ROOT=/usr/include/ace
ENV TBB_ROOT_DIR=/usr/include/tbb
ENV CCACHE_DIR=/opt/ccache

ENV DEBUG 0
ENV MALLOC 0
ENV SCRIPTS 1
ENV LIBCURL 1

CMD cd /opt/build && \
	cmake \
	--log-level=VERBOSE \
	-DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
	-DDEBUG=$DEBUG \
	-DUSE_STD_MALLOC=$MALLOC \
	-DUSE_EXTRACTORS=$BUILDER_EXTRACTORS \
	-DUSE_ANTICHEAT=$BUILDER_ANTICHEAT \
	-DSCRIPTS=$SCRIPTS \
	-DUSE_LIBCURL=$LIBCURL \
	-DSUPPORTED_CLIENT_BUILD=$BUILDER_CLIENT_VERSION \
	-DCMAKE_INSTALL_PREFIX=/opt/vmangos /opt/core && \
	make -j$(nproc) && \
	make install
	