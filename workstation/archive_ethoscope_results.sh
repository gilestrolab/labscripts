## save on box.com current results.
# to be done once a week

#!/bin/bash
src=/data/ethoscope_results/
dst_prefix=/mnt/box.com
dst_dir=/shared/ethoscope_results
(
  flock -x -w 10 200 || exit 1
  rsync -ahW --stats --size-only  --inplace  $src  $dst_prefix/$dst_dir/
) 200>/var/lock/.$(basename $src).exclusivelock
