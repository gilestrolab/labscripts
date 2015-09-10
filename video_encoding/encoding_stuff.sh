# this is not a script meant to run
exit
# transcode video to mpeg4,m using lavc 
mencoder onput.avi  -o output.avi -ovc lavc -lavcopts vcodec=mpeg4


# Crop a part of the video
ffmpeg -i input.avi -vf crop=W:H:x0:y0  output.avi

#how to encode a raw video, e.g from coriander
# note that y8 is for the format, it could be  yuv
cat input.raw | mencoder -demuxer rawvideo -rawvideo fps=30:y8:w=1280:h=960 -of avi -nosound -ovc lavc -lavcopts vcodec=mpeg2video:vbitrate=5000 -really-quiet -o output.avi -
