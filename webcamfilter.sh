#!/bin/dash
ffmpeg -i /dev/video0 -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 -vf eq=1.2:0.15:1:1.5:1:1 /dev/video1
