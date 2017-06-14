#! /bin/bash

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"

SRC_FILE="assets-light.svg"
ASSETS_DIR="light-assets"
DARK_ASSETS_DIR="dark-assets"
DARK_SRC_FILE="assets-dark.svg"
INDEX="assets.txt"

rm $ASSETS_DIR/*
rm $DARK_ASSETS_DIR/*
for i in `cat $INDEX`
do
if [ -f $ASSETS_DIR/$i.png ]; then
    echo $ASSETS_DIR/$i.png exists.
elif [ -f $DARK_ASSETS_DIR/$i.png ]; then
    echo $DARK_ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-background-opacity=0 \
              --export-png=$ASSETS_DIR/$i.png $SRC_FILE >/dev/null \
    && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png
    echo Rendering $DARK_ASSETS_DIR/$i.png
        $INKSCAPE --export-id=$i \
                  --export-id-only \
                  --export-background-opacity=0 \
                  --export-png=$DARK_ASSETS_DIR/$i.png $DARK_SRC_FILE >/dev/null \
        && $OPTIPNG -o7 --quiet $DARK_ASSETS_DIR/$i.png
fi
done
exit 0
