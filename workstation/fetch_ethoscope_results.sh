DAVFS_MNT_DIR="/mnt/box.com"
mount $DAVFS_MNT_DIR
rsync -avhP --size-only  --inplace  $DAVFS_MNT_DIR/gglab/shared/ethoscope_results/ /data/ethoscope_results/ --exclude=lost+found --exclude="*.db-journal" --exclude="*.zip" --exclude="*.db.*"
umount $DAVFS_MNT_DIR
