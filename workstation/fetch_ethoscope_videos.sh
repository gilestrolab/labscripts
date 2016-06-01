#!/bin/bash
result_dir=ethoscope_videos/
source_prefix=/mnt/nas/auto_generated_data/
target_prefix=/data/
(
  flock -x -w 10 200 || exit 1
  rsync -avhP --size-only  --inplace  $source_prefix/$result_dir/  $target_prefix/$result_dir/  --exclude=lost+found
  systemctl start $backup_service
) 200>/var/lock/.$(basename $result_dir).exclusivelock
