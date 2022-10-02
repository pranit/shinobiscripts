#!/bin/bash

find  /home/Shinobi/videos -mtime -1 -print | grep mp4 > /home/Shinobi/videos/files2copy
#nvrfiles='find  /home/Shinobi/videos -mtime -1 -print | grep mp4'

HOST='0.0.0.0'
USER='user'
PASSWD='password'
FILE='/home/Shinobi/videos/files2copy'

#ftp -n $HOST <<END_SCRIPT
#quote USER $USER
#quote PASS $PASSWD
#binary
#put $FILE
#quit
#END_SCRIPT
#exit 0

while IFS= read -r  line
do
        ftp -n -v $HOST <<EOT
        quote USER $USER
        quote PASS $PASSWD
        binary
        put $line
EOT
done < "$FILE"

