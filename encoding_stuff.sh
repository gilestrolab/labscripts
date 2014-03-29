# this is not a script meant to run
exit
#how to encode a raw video, e.g from coriander
# note that y8 is for the format, it could be  yuv
cat input.raw | mencoder -demuxer rawvideo -rawvideo fps=30:y8:w=1280:h=960 -of avi -nosound -ovc lavc -lavcopts vcodec=mpeg2video:vbitrate=5000 -really-quiet -o output.avi -
