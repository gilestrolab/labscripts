#!/bin/bash

#Backup data from a remote machine locally
#Follow tutorial (here)[http://ubuntuforums.org/showthread.php?t=15082] to add ssh key.

HOST_NAME=155.198.235.200
USER=$(whoami)
REMOTE_DIR=/data/sleepysnail/raw

rsync -e ssh -aru $HOST_NAME:$REMOTE_DIR $REMOTE_DIR

# $REMOTE_DIR MUST exixt on your the local machine (and have the appropriate permission)
