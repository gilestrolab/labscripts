systemctl stop ethoscope_backup && 
sleep 30 &&
rsync -avhP --size-only  --inplace  /ethoscope_results/  /mnt/dav/auto_generated_data/ethoscope_results/  --exclude=lost+found --exclude="*.db-journal" --exclude="*.zip" --exclude="*.db.*"
systemctl start ethoscope_backup

