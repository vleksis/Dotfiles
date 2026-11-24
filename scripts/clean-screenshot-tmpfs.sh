#!/bin/sh
set -eu

mount_point=${1:?mount point required}
retention_minutes=${2:?retention in minutes required}

if [ ! -d "$mount_point" ] || [ ! -x "$mount_point" ]; then
  exit 0
fi

# Stay on the mounted tmpfs and do not follow symbolic links.
exec /usr/bin/find -P -x "$mount_point" -fstype tmpfs -type f -mmin "+$retention_minutes" -delete
