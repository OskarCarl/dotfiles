#!/bin/bash

META=/media/DTVP30
DATA=/media/SECURITY
EXPLORER=lf

unlock_key() {
	if [[ ! -d "$META" ]]; then
		doas mkdir -p "$META"
	fi
	if [[ ! `mount | grep "$META"` ]]; then
		printf "Mounting program partition.\n"
		doas mount -o ro,exec /dev/disk/by-label/DTVP30 "$META"
	fi
	if [[ ! ( -d "$DATA" && `mount | grep "$DATA"` ) ]]; then
		printf "Unlocking data partition.\n"
		doas "$META"/linux/linux64/dtvp_login
	fi
}

unlock_wait() {
	if [[ -d "$DATA" && `mount | grep "$DATA"` ]]; then
		return
	fi
	printf "Waiting for data partition to appear.."
	i=0
	while [ ! -e /dev/disk/by-label/SECURITY -a $i -lt 5 ]; do
		sleep 1
		printf "%d.." $(( 4 - $i))
		i=$(( $i + 1 ))
	done
	printf "Done.\n"
	if [[ ! -e /dev/disk/by-label/SECURITY ]]; then
		printf "Unlocked disk did not appear. Please retry or troubleshoot manually.\n" >&2
		exit 1
	fi
}

lock_key() {
	if [[ -d "$META" && `mount | grep "$META"` ]]; then
		printf "Locking data partition.\n"
		doas "$META"/linux/linux64/dtvp_logout
		printf "Unmounting program partition.\n"
		doas umount "$META"
		doas rmdir "$META"
	fi
}

mount_disk() {
	if [[ ! `mount | grep "$DATA"` ]]; then
		printf "Mounting data partition.\n"
		udevil mount /dev/disk/by-label/SECURITY
	fi
}

umount_disk() {
	if [[ -d "$DATA" && `mountpoint "$DATA"` ]]; then
		printf "Unmounting data partition.\n"
		udevil umount /dev/disk/by-label/SECURITY
	fi
}

case "$1" in
	unlock)
		unlock_key
		unlock_wait
		mount_disk
		;;
	lock)
		umount_disk
		lock_key
		;;
	explorer)
		unlock_key
		unlock_wait
		mount_disk
		$EXPLORER $DATA
		umount_disk
		lock_key
		;;
	*)
		printf "Please choose an action: {lock, unlock, explorer}\n"
		exit 1
		;;
esac

