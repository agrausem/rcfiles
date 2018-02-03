



function enable_beets () {

	ping -q -c2 lchouffe >> /dev/null

	if [ $? -eq 0 ]
	then
		_music_volume=/media/chouffe/music
		_music_metal=$_music_volume/metal
		_music_play=$_music_volume/playlists
		_kodi_lists=".kodi/userdata/playlists"

		function bartist () {
			artist="$1"
			shift
			beet ls $@ "albumartist:$artist"
		}

		function mount_chouffe_music () {
			if [ ! -d $_music_metal ] 
			then
				sudo mount -o defaults,rw lchouffe:/volume1/music $_music_volume
			fi
		}

		function umount_chouffe_music () {
			if [ -d $_music_metal ]
			then
				sudo umount $_music_volume
			fi
		}

		function show_playlist () {
			sed -r -e 's#.*metal/(.+) .*/\[(.+)\] (.+)/.*#\1: \3 (\2)#g' "$1" | uniq | sort -d
		}

		function osmc_playlist () {
		    if [ $# -lt 1 ]
		    then
			echo "usage: _osmc_playlist playlist_file"
		    else
		        playlist_name=$(basename "$1")
		        year=$(basename $(dirname "$1"))
		        sed -e 's#^\.\.#nfs://192.168.2.102/volume1/music#g' "$1" > "/tmp/$playlist_name"
		        scp "/tmp/$playlist_name" "osmc:$_kodi_lists/music/$year/"
		        rm "/tmp/$playlist_name"
		    fi
		}

		function osmc_favourite () {
		    playlists_root="$_kodi_lists/music"
		    if [ -z $1 ]
		    then
			    this_year=$(date +%Y)
		    else
			    this_year=$1
		    fi
		    last_year=$(( $this_year - 1))

		    pls=$(ssh osmc "ls -r $_kodi_lists/music/$this_year/ | head -n 2")

		    if [ -n $pls ]
		    then
			    actual="$this_year/$(echo $pls | head -n 1 | sed -e 's/ /\\&/g')"
			    last="$this_year/$(echo $pls | tail -n 1 | sed -e 's/ /\\&/g')"
			    ssh osmc "cd $playlists_root && ln -f -s $actual actual.m3u"
			    if [ $actual != $last ]
			    then
				    ssh osmc "cd $playlists_root && ln -f -s $last last.m3u"
			    else
				    last="$last_year/$(ssh osmc ls -r $playlists_root/$last_year/ | head -n 1 | sed -e 's/ /\\&/g')"
				    ssh osmc "cd $playlists_root && ln -f -s $last last.m3u"
			    fi
		    else
			    osmc_favourite $last_year
		    fi
		}

		mount_chouffe_music
		alias show_imported="show_playlist $_music_play/imported.m3u"
		workon beets
	else
		echo 'chouffe is not reachable. Aborting...'
	fi

}

function disable_beets () {
	umount_chouffe_music
	unalias show_imported
	unset $_music_volume
	unset $_music_metal
	unset $_music_play
	unset $_kodi_lists
	unfunction bartist
	unfunction mount_chouffe_music
	unfunction umount_chouffe_music
	unfunction show_playlist
	unfunction osmc_playlist
	unfunction osmc_favourite
	deactivate
}
