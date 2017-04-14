function smart_check_all_disks() {
  local smart_check_all_disks_DISK
  local smart_check_all_disks_ERROR=0
  for smart_check_all_disks_DISK in `ls -d /dev/disk/by-id/ata-*`
  do
    echo $smart_check_all_disks_DISK
    smartctl -q errorsonly -a $smart_check_all_disks_DISK
    local smart_check_all_disks_RETVAL=$?
    if [ $smart_check_all_disks_RETVAL -gt 0 ]; then
      smart_check_all_disks_ERROR=$smart_check_all_disks_RETVAL
    fi
  done
  return $smart_check_all_disks_ERROR
}
