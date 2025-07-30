#!/bin/bash

function convert() {
	mkdir output
	for file in *.{mp3,MP3,wav,flac,m4a} ; do
		ffmpeg -i "$file" -codec:a libmp3lame -qscale:a 0 -map_metadata 0 -id3v2_version 3 "output/$(basename "${file/.*}").mp3";
	done

}

if [ -z "$1" ] ; then
	convert
else
	for dir in $1 ; do
		cd "$dir"
		convert
		cd -
	done
fi
