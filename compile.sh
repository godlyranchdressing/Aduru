#! /bin/bash
VARIANTS="variants.txt"
COMPILED_FOLDER="scss/compiled-css"
OUTPUT="Compiled"

# GTK2 #
COMMON_FOLDER="src/gtk-2.0/common-files"
ASSETS_FOLDER="src/gtk-2.0/variant-assets"
###
  echo "Compiling and copying..."
for variant in "","" "-Dark","-dark"; do IFS=","; set -- $variant;
  sassc -t expanded src/gnome-shell/gnome-shell${1,,}.scss $OUTPUT/Aduru${1^}/gnome-shell/gnome-shell.css
  rm $OUTPUT/Aduru${1^}/gnome-shell/assets/* -R
  cp src/gnome-shell/assets-common/* $OUTPUT/Aduru${1^}/gnome-shell/assets/ -R
  cp src/gnome-shell/assets${2,,}/* $OUTPUT/Aduru${1^}/gnome-shell/assets/ -R
done

for variant in "","" "-Dark","-dark"; do
  if [ $1="-Dark" ];
    then
        sassc -t expanded src/gtk-3.0/gtk-dark.scss $OUTPUT/Aduru-Dark/gtk-3.0/gtk.css
        cp src/gtk-3.0/assets/*dark* $OUTPUT/Aduru-Dark/gtk-3.0/assets
        cp src/gtk-2.0/common-files/* $OUTPUT/Aduru-Dark/gtk-2.0/
        cp src/gtk-2.0/dark-variant-files/* $OUTPUT/Aduru-Dark/gtk-2.0/
        cp src/gtk-2.0/assets/common-assets/* $OUTPUT/Aduru-Dark/gtk-2.0/assets
        cp src/gtk-2.0/assets/dark-assets/* $OUTPUT/Aduru-Dark/gtk-2.0/assets
        cp src/gtk-2.0/gtkrc-dark $OUTPUT/Aduru-Dark/gtk-2.0/gtkrc
    fi
        sassc -t expanded src/gtk-3.0/gtk.scss $OUTPUT/Aduru/gtk-3.0/gtk.css
        sassc -t expanded src/gtk-3.0/gtk-dark.scss $OUTPUT/Aduru/gtk-3.0/gtk-dark.css
        cp src/gtk-3.0/assets/* $OUTPUT/Aduru/gtk-3.0/assets
        cp src/gtk-2.0/common-files/* $OUTPUT/Aduru/gtk-2.0/
        cp src/gtk-2.0/assets/common-assets/* $OUTPUT/Aduru/gtk-2.0/assets
        cp src/gtk-2.0/assets/light-assets/* $OUTPUT/Aduru/gtk-2.0/assets
        cp src/gtk-2.0/gtkrc-light $OUTPUT/Aduru/gtk-2.0/gtkrc
      break
done
