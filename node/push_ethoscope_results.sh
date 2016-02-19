DAVFS_MNT_DIR="/mnt/box.com"
mount $DAVFS_MNT_DIR
rsync -avhP --size-only  --inplace  /ethoscope_results/  $DAVFS_MNT_DIR/gglab/shared/ethoscope_results/  --exclude=lost+found --exclude="*.db-journal" --exclude="*.zip" --exclude="*.db.*"
umount $DAVFS_MNT_DIR
