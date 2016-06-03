## save on box.com current results.
# to be done once a week

#!/bin/bash
src=/data/ethoscope_results/
dst_prefix=/mnt/box.com
dst_dir=gglab/shared/ethoscope_results
(
  flock -x -w 10 200 || exit 1
  umount $dst_prefix
  mount $dst_prefix &&
  echo "Starting backup" &&
  rsync -ahWPv --stats --size-only  --inplace  $src  $dst_prefix/$dst_dir/
  umount $dst_prefix
) 200>/var/lock/.$(basename $src).exclusivelock
