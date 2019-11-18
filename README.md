# tldr-nginx-ffserver

```bash
# ffmpeg -f mjpeg -i "http://192.168.0.3:81/stream" -override_ffserver -c:v mjpeg -metadata:s:v rotate=0 -vf "drawtext=text='%{localtime}':x=10:y=10:borderw=1:bordercolor=black:fontcolor=white:fontsize=20"

    ffmpeg \
        -re \
        -f lavfi \
        -i testsrc=size=640x480:rate=12 \
            -metadata:s:v rotate=0 \
            -vf "drawtext=text='%{localtime}':x=10:y=10:borderw=1:bordercolor=black:fontcolor=white:fontsize=20" \
    http://localhost:8080/ff/feed01.ffm
```
