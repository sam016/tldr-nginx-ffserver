FROM nginx:1.17.5-alpine
LABEL maintainer=sam016

ENV FFMPEG_VERSION=3.4.6

WORKDIR /tmp/ffmpeg

RUN apk add --update build-base curl nasm tar bzip2 \
    zlib-dev openssl-dev yasm-dev lame-dev libogg-dev x264-dev libvpx-dev libvorbis-dev x265-dev freetype-dev libass-dev libwebp-dev rtmpdump-dev libtheora-dev opus-dev && \
    #
    # environment variables
    DIR=$(mktemp -d) && cd ${DIR} && \
    #
    # download ffmpeg and build from sources
    curl -s http://ffmpeg.org/releases/ffmpeg-${FFMPEG_VERSION}.tar.gz | tar zxvf - -C . && \
    cd ffmpeg-${FFMPEG_VERSION} && \
    ./configure \
    --enable-version3 --enable-gpl --enable-nonfree --enable-small --enable-libmp3lame --enable-libx264 --enable-libx265 --enable-libvpx --enable-libtheora --enable-libvorbis --enable-libopus --enable-libass --enable-libwebp --enable-librtmp --enable-postproc --enable-avresample --enable-libfreetype --enable-openssl --disable-debug && \
    make && \
    make install && \
    make distclean && \
    #
    # cleaning up
    rm -rf ${DIR} && \
    apk del build-base curl nasm tar bzip2 x264 openssl && rm -rf /var/cache/apk/*

WORKDIR /code

RUN apk add --update apache2-utils

COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s /usr/local/bin/docker-entrypoint.sh / # backwards compat

ENTRYPOINT [ "docker-entrypoint.sh" ]
