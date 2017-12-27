#!/bin/bash

# CROP
DIR="/tmp/magick"
LEFT=$1
TOP=$2
WIDTH=400
HEIGHT=400

# ANOTATE
SPLIT="_"
SELECT=3
ALEFT=$LEFT
ATOP=`expr $TOP + $HEIGHT - 10`
FONT="/System/Library/Fonts/ヒラギノ角ゴシック W6.ttc"
SIZE=48
COLOR="#990099"

# TILING
BGCOLOR="#cccccc"
TILE="6x"
PATTERN=${3:-.png}
OUT=${4:-out.png}

mkdir -p $DIR
rm ${DIR}/*.png

for FILE in `ls . | grep "$PATTERN"`; do
	IFS_ORIG="$IFS"
	IFS="$SPLIT"
	arr=(${FILE%.*})
	IFS="$IFS_ORIG"
	TEXT=${arr[$SELECT]}
	echo "crop $FILE"
  convert -crop ${WIDTH}x${HEIGHT}+${LEFT}+${TOP} -font "$FONT" -pointsize $SIZE -fill $COLOR -annotate +${ALEFT}+${ATOP} $TEXT $FILE ${DIR}/${FILE}
done

echo "generate ${OUT}"
montage -background $BGCOLOR -tile $TILE -resize 100% -geometry +0+0 ${DIR}/*.png ${OUT}

rm -rf ${DIR}
