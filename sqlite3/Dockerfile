FROM alpine:3.11
ENV LANG en_US.utf8

ENV MAJOR 3
ENV VERSION 320200
ENV SHA1 3a9cd8b17c4724be61bc05f3c5e81bcdd78db0fe

RUN set -ex \
 \
 && apk add --no-cache --virtual .fetch-deps \
    bash \
    tar \
    unzip \
    wget \
 \
 && wget -O sqlite3.zip https://www.sqlite.org/2020/sqlite-amalgamation-3320200.zip \
 && echo "$SHA1 *sqlite3.zip" | sha1sum -c - \
 && mkdir -p /usr/src/sqlite3 \
 && unzip sqlite3.zip  -d /usr/src/sqlite3 \
 \
 && apk add --no-cache --virtual .build-deps \
    cmake clang clang-dev \
    bison \
    coreutils \
    dpkg-dev dpkg \
    flex \
 	gcc \
 	g++ \
 	wget \
 	curl \
 	freetds \
 	openssl \
 	libc-dev \
 	libedit-dev \
 	libxml2-dev \
 	libxslt-dev \
 	linux-headers \
 	make \
 	openssl-dev \
 	perl-utils \
 	perl-ipc-run \
 	python \
 	python3 \
    perl-dev \
    python-dev \
 	util-linux-dev \
 	zlib-dev \
 	icu-dev \
    \
  && cd /usr/src/sqlite3/sqlite-amalgamation-3320200 \
  && gcc shell.c sqlite3.c -lpthread -ldl \
  && mkdir -p /opt/sqlite
  && mv a.out /opt/sqlite/sqlite3
  && apk del .fetch-deps .build-deps

VOLUME ["/opt/sqlite"]

CMD ["/bin/bash"]


