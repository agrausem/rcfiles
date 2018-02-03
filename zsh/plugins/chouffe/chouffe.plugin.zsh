chouffe='lchouffe:/volume1'
dest='/media/chouffe'

function mount_chouffe () {	
	for dir in downloads music video homes
	do
		sudo mount -o defaults,rw $chouffe/$dir $dest/$dir
	done
}

function umount_chouffe () {
	for dir in downloads music video homes
	do
		sudo umount -f "$dest/$dir"
	done
}
