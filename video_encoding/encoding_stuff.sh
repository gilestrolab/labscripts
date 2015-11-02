# this is not a script meant to run
exit
# transcode video to mpeg4,m using lavc 
mencoder onput.avi  -o output.avi -ovc lavc -lavcopts vcodec=mpeg4


# Crop a part of the video
ffmpeg -i input.avi -vf crop=W:H:x0:y0  output.avi

#how to encode a raw video, e.g from coriander
# note that y8 is for the format, it could be  yuv
cat input.raw | mencoder -demuxer rawvideo -rawvideo fps=30:y8:w=1280:h=960 -of avi -nosound -ovc lavc -lavcopts vcodec=mpeg2video:vbitrate=5000 -really-quiet -o output.avi -

# Reencode a video acquired with an ethoscope. 
# Typically 10x smaller without too much quality loss for 20 flies in tubes
# One can play with -crf. the larger the worst quality (hence the smaller file, from 0 to 51)
# Also, -preset can be one of {ultrafast, superfast, fast, medium, slow,...}. It make better quality for ~ the same size
# See also https://trac.ffmpeg.org/wiki/Encode/H.264
ffmpeg  -i my_input.mp4 -c:v libx264 -preset medium -tune ssim -crf 28 -c:a copy  my_output.mp4

# Same as above bu resample at 2fps (-r 2). It is much faster to encode as we drop frames.
ffmpeg  -i my_input.mp4 -r 2 -c:v libx264 -preset medium -tune ssim -crf 28 -c:a copy  my_output.mp4



