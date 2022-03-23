#!/bin/bash
mpv https://youtube.com/watch?v=$(yt-dlp -j "ytsearch5:$*" | jq -M -r '"[" + .uploader + "] " + .title + " " + .id' | fzf | rev | cut -d ' ' -f 1 | rev)
