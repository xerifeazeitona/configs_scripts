#!/bin/bash
yt-dlp -j "ytsearch5:$*" | jq -M -r '"[" + .uploader + "] " + .title, "https://youtube.com/watch?v=" + .id'
