#!/bin/bash
# we ensure the backup service is stopped durring backup, so we do not keep modifiying files
# during backup 
backup_service=ethoscope_backup
result_dir=ethoscope_results/
target_prefix=/mnt/nas/auto_generated_data/
(
  ## we use flock to ensure npo concurent backups
  # see http://stackoverflow.com/questions/169964/how-to-prevent-a-script-from-running-simultaneously
  # Wait for lock on /var/lock/.myscript.exclusivelock (fd 200) for 10 seconds
  flock -x -w 10 200 || exit 1
  systemctl stop $backup_service && 
  sleep 30 &&
  python2 /root/incremental_size_upload.py  -s /$result_dir/  -d $target_prefix/$result_dir/
  systemctl start $backup_service

) 200>/var/lock/.$backup_service.exclusivelock


