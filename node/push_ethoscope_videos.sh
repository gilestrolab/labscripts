systemctl stop ethoscope_video_backup && 
sleep 30 &&
rsync -avhP --size-only  --inplace  /ethoscope_videos/  /mnt/dav/auto_generated_data/ethoscope_videos/  --exclude=lost+found
systemctl start ethoscope_video backup
