#! /bin/bash
VARIANTS="variants.txt"
COMPILED_FOLDER="scss/compiled-css"
OUTPUT="Compiled"

# GTK2 #
COMMON_FOLDER="src/gtk-2.0/common-files"
ASSETS_FOLDER="src/gtk-2.0/variant-assets"
###

  echo "Compiling and copying..."
  for variant in "","", "-Dark","-dark"; do IFS=","; set -- $variant;
    sassc -t expanded src/gnome-shell/gnome-shell${1,,}.scss $OUTPUT/Aduru${1^}/gnome-shell/gnome-shell.css
    rm $OUTPUT/Aduru${1^}/gnome-shell/assets/* -R
    cp src/gnome-shell/assets-common/* $OUTPUT/Aduru${1^}/gnome-shell/assets/ -R
    cp src/gnome-shell/assets${2,,}/* $OUTPUT/Aduru${1^}/gnome-shell/assets/ -R
done

for variant in "","" "-Dark","-dark", "", "-Darker"; do
  if [ $1="-Dark" ]; then
    for size in "", "-Compact"; do
      sassc -t expanded src/gtk-3.0/gtk-dark${size,,}.scss $OUTPUT/Aduru-Dark${size}/gtk-3.0/gtk.css
      cp src/gtk-3.0/assets/*dark* $OUTPUT/Aduru-Dark${size}/gtk-3.0/assets
      cp src/gtk-2.0/common-files/* $OUTPUT/Aduru-Dark${size}/gtk-2.0/
      if [ $size="-Compact" ]; then
        cp src/gtk-2.0/common-files-compact/* $OUTPUT/Aduru-Dark${size}/gtk-2.0/
      fi
      cp src/gtk-2.0/dark-variant-files/* $OUTPUT/Aduru-Dark${size}/gtk-2.0/
      cp src/gtk-2.0/assets/common-assets/* $OUTPUT/Aduru-Dark${size}/gtk-2.0/assets
      cp src/gtk-2.0/assets/dark-assets/* $OUTPUT/Aduru-Dark${size}/gtk-2.0/assets
      cp src/gtk-2.0/gtkrc-dark $OUTPUT/Aduru-Dark${size}/gtk-2.0/gtkrc
    done
  fi

  if [ $1="-Darker" ]; then
    for size in "", "-Compact"; do
      sassc -t expanded src/gtk-3.0/gtk-darker${size,,}.scss $OUTPUT/Aduru-Darker${size}/gtk-3.0/gtk.css
      sassc -t expanded src/gtk-3.0/gtk-dark${size,,}.scss $OUTPUT/Aduru-Darker${size}/gtk-3.0/gtk-dark.css
      cp src/gtk-3.0/assets/* $OUTPUT/Aduru-Darker${size}/gtk-3.0/assets
      cp src/gtk-2.0/common-files/* $OUTPUT/Aduru-Darker${size}/gtk-2.0/
      if [ $size="-Compact" ]; then
        cp src/gtk-2.0/common-files-compact/* $OUTPUT/Aduru-Darker${size}/gtk-2.0/
      fi
      cp src/gtk-2.0/assets/common-assets/* $OUTPUT/Aduru-Darker${size}/gtk-2.0/assets
      cp src/gtk-2.0/assets/light-assets/* $OUTPUT/Aduru-Darker${size}/gtk-2.0/assets
      cp src/gtk-2.0/gtkrc-darker $OUTPUT/Aduru-Darker${size}/gtk-2.0/gtkrc
    done
  fi

  for size in "", "-Compact"; do
    sassc -t expanded src/gtk-3.0/gtk${size,,}.scss $OUTPUT/Aduru${size}/gtk-3.0/gtk.css
    sassc -t expanded src/gtk-3.0/gtk-dark${size,,}.scss $OUTPUT/Aduru${size}/gtk-3.0/gtk-dark.css
    cp src/gtk-3.0/assets/* $OUTPUT/Aduru${size}/gtk-3.0/assets
    cp src/gtk-2.0/common-files/* $OUTPUT/Aduru${size}/gtk-2.0/
    if [ $size="-Compact" ]; then
      cp src/gtk-2.0/common-files-compact/* $OUTPUT/Aduru${size}/gtk-2.0/
    fi
    cp src/gtk-2.0/assets/common-assets/* $OUTPUT/Aduru${size}/gtk-2.0/assets
    cp src/gtk-2.0/assets/light-assets/* $OUTPUT/Aduru${size}/gtk-2.0/assets
    cp src/gtk-2.0/gtkrc-light $OUTPUT/Aduru${size}/gtk-2.0/gtkrc
  done
  break
done
