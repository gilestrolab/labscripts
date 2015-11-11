# acquire a video
/opt/vc/bin/raspivid -fps 20 -h 960 -w 1280 -b 200000 -t 0 -e -o my_output.h264

# we tested -b 200000 for normal fruit flies videos with 40 flies moving at 
# the same time in normal illumination, and it seems conservative enough. 
# Higher values will yield higher quality, but will be larger
