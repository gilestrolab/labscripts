#!/bin/bash
result_dir=ethoscope_results/
source_prefix=/mnt/nas/auto_generated_data/
target_prefix=/data/
(
  flock -x -w 10 200 || exit 1
  rsync -ah --stats --size-only  --inplace  $source_prefix/$result_dir/  $target_prefix/$result_dir/  --exclude=lost+found --exclude="*.db-journal" --exclude="*.zip" --exclude="*.db.*"
) 200>/var/lock/.$(basename $result_dir).exclusivelock
