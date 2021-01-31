export CHOUFFE='192.168.178.30'
export CHOUFFE_VOLUME_URI="$CHOUFFE:/volume1"
export MOUNT_CHOUFFE='/media/chouffe'

function mount_chouffe () {	
	for dir in downloads music video homes photo
	do
		sudo mount -t nfs -o defaults,rw $CHOUFFE_VOLUME_URI/$dir $MOUNT_CHOUFFE/$dir
	done
}

function umount_chouffe () {
	for dir in downloads music video homes photo
	do
		sudo umount -f "$MOUNT_CHOUFFE/$dir"
	done
}
