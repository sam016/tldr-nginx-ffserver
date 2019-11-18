#!/bin/sh

/usr/bin/ffmpeg \
    -y \
    -re \
    -f lavfi \
    -i testsrc=size=640x480:rate=12 \
        -metadata:s:v rotate=0 \
        -vf "drawtext=text='%{localtime}':x=10:y=10:borderw=1:bordercolor=black:fontcolor=white:fontsize=20" \
    http://localhost:8080/ff/feed01.ffm
    # testsrc.flv
