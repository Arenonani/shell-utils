#!/bin/bash

# CROP
DIR=$3
LEFT=$1
TOP=$2
WIDTH=400
HEIGHT=400

mkdir -p $DIR
rm ${DIR}/*.png

for FILE in `ls . | grep .png`; do
	echo "crop $FILE"
  convert -crop ${WIDTH}x${HEIGHT}+${LEFT}+${TOP} $FILE ${DIR}/${FILE}
done

