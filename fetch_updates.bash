#!/bin/bash
DEST="updated/"
FILENAMES=$DEST"filenames"
LIST=$DEST"list"
NAMES=$DEST"names"
LATEST=$DEST"names"

mkdir $DEST

ls *.apk > $LIST

cat $LIST | while read FILE; do echo "${FILE%.*}";  done > $FILENAMES

cat $FILENAMES | while read FILE; do echo "${FILE%_*}";  done | sort | uniq > $NAMES

cat $NAMES | while read F; 
do
	echo "Fetching latest version of "$F;
	ls "$F"*.apk | sort | tail -1 | xargs -I % cp % $DEST
done

rm $FILENAMES
rm $LIST
rm $NAMES

