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

#Client versions builds and corresponding values
#define CLIENT_BUILD_1_2_4 4222
#define CLIENT_BUILD_1_3_1 4297
#define CLIENT_BUILD_1_4_2 4375
#define CLIENT_BUILD_1_5_1 4449
#define CLIENT_BUILD_1_6_1 4544
#define CLIENT_BUILD_1_7_1 4695
#define CLIENT_BUILD_1_8_4 4878
#define CLIENT_BUILD_1_9_4 5086
#define CLIENT_BUILD_1_10_2 5302
#define CLIENT_BUILD_1_11_2 5464
#define CLIENT_BUILD_1_12_1 5875
ENV CLIENT CLIENT_BUILD_1_12_1

ENV EXTRACTORS 0
ENV ANTICHEAT 1
ENV SCRIPTS 1
ENV LIBCURL 1

CMD cd /opt/build && \
	cmake \
	--log-level=VERBOSE \
	-DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
	-DDEBUG=$DEBUG \
	-DUSE_STD_MALLOC=$MALLOC \
	-DUSE_EXTRACTORS=$EXTRACTORS \
	-DUSE_ANTICHEAT=$ANTICHEAT \
	-DSCRIPTS=$SCRIPTS \
	-DUSE_LIBCURL=$LIBCURL \
	-DSUPPORTED_CLIENT_BUILD=$CLIENT \
	-DCMAKE_INSTALL_PREFIX=/opt/vmangos /opt/core && \
	make -j$(nproc) && \
	make install
	