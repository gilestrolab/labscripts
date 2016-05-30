#!/bin/bash

result_dir=ethoscope_results/
source_prefix=/mnt/nas/auto_generated_data/
target_prefix=/data/
(
  ## we use flock to ensure npo concurent backups
  # see http://stackoverflow.com/questions/169964/how-to-prevent-a-script-from-running-simultaneously
  # Wait for lock on /var/lock/.myscript.exclusivelock (fd 200) for 10 seconds
  flock -x -w 10 200 || exit 1
  systemctl stop $backup_service && 
  sleep 30 &&
  rsync -avhP --size-only  --inplace  $source_prefix/$result_dir/  $target_prefix/$result_dir/  --exclude=lost+found --exclude="*.db-journal" --exclude="*.zip" --exclude="*.db.*"
  systemctl start $backup_service

) 200>/var/lock/.myscript.exclusivelock
