#!/bin/bash

# CROP
PATTERN=${3:-.png}
DIR=${4:-crop}
LEFT=${1:-0}
TOP=${2:-0}
WIDTH=400
HEIGHT=400

mkdir -p $DIR
rm ${DIR}/*.png

for FILE in `ls . | grep "$PATTERN"`; do
	echo "crop $FILE"
  convert -crop ${WIDTH}x${HEIGHT}+${LEFT}+${TOP} $FILE ${DIR}/${FILE}
done

