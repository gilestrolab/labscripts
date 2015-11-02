# `-r 20` means you have use a fps of 20 when acquiring the video (that is `-fps 20` in raspivid)
ffmpeg -r 20 -i video.h264 -vcodec copy video.mp4
