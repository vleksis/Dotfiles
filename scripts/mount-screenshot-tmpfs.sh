#!/bin/sh
set -eu

mount_point=${1:?mount point required}
owner=${2:?owner required}

if [ -L "$mount_point" ]; then
  printf '%s\n' "Mount point is a symbolic link: $mount_point" >&2
  exit 1
fi

if [ ! -d "$mount_point" ]; then
  /usr/bin/install -d -m 0700 "$mount_point"
fi

# df reports the enclosing filesystem if the directory is not itself a mount point.
filesystem=$(/bin/df --libxo json -Y "$mount_point")
mounted_on=$(printf '%s\n' "$filesystem" | /usr/bin/plutil -extract storage-system-information.filesystem.0.mounted-on raw -expect string -o - -)
if [ "$mounted_on" = "$mount_point" ]; then
  filesystem_type=$(printf '%s\n' "$filesystem" | /usr/bin/plutil -extract storage-system-information.filesystem.0.type raw -expect string -o - -)
  if [ "$filesystem_type" != tmpfs ]; then
    printf '%s\n' "Another filesystem ($filesystem_type) is mounted at $mount_point" >&2
    exit 1
  fi
else
  /sbin/mount_tmpfs -o nosuid,nodev,noexec,nobrowse -s 512m "$mount_point"
fi

/bin/chmod 0700 "$mount_point"
/usr/sbin/chown "$owner" "$mount_point"
