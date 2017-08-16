#! /bin/bash
THEME="Aduru"

for variant in "","", "-Dark","-dark"; do IFS=","; set -- $variant;
  for size in "" "-Compact"; do
    INPUT=src/gnome-shell
    OUTPUT=Compiled/$THEME$1$size/gnome-shell
    sassc -t expanded $INPUT/gnome-shell$2.scss $OUTPUT/gnome-shell.css
    rm $OUTPUT/assets/* -R
    cp $INPUT/assets-common/* $OUTPUT/assets/ -R
    cp $INPUT/assets$2/* $OUTPUT/assets/
  done
done
for buttons in "", "-OSX"; do
  if [[ $buttons != "-OSX" ]]; then
    # get rid of some whitespace that just won't go away
    buttons=""
  fi

  for variant in "","" "-dark","-Dark" "-darker","-Darker"; do IFS=","; set -- $variant;
    for size in "" "-Compact"; do
      INPUT=src/gtk-3.0
      if [[ "$buttons" = "-OSX" ]]; then
        OUTPUT=Compiled/$THEME$buttons$2$size/gtk-3.0
        if [[ "$2" != "-Dark" ]]; then
          sassc -t expanded $INPUT/gtk${buttons,,}${1}${size,,}.scss $OUTPUT/gtk.css
          sassc -t expanded $INPUT/gtk${buttons,,}-dark${size,,}.scss $OUTPUT/gtk-dark.css
          # rm $OUTPUT/assets/*
          cp $INPUT/assets/* $OUTPUT/assets
        else
          sassc -t expanded $INPUT/gtk${buttons,,}${1}${size,,}.scss $OUTPUT/gtk.css
          cp $INPUT/assets/*dark* $OUTPUT/assets
        fi
      else
        OUTPUT=Compiled/$THEME$2$size/gtk-3.0
        if [[ "$2" != "-Dark" ]]; then
          sassc -t expanded $INPUT/gtk${1}${size,,}.scss $OUTPUT/gtk.css
          sassc -t expanded $INPUT/gtk-dark${size,,}.scss $OUTPUT/gtk-dark.css
          # rm $OUTPUT/assets/*
          cp $INPUT/assets/* $OUTPUT/assets
        else
          sassc -t expanded $INPUT/gtk${1}${size,,}.scss $OUTPUT/gtk.css
          cp $INPUT/assets/*dark* $OUTPUT/assets
        fi
      fi

      for size in "" "-Compact"; do
        INPUT=src/gtk-2.0
        OUTPUT=Compiled/$THEME${buttons}$2$size/gtk-2.0

        if [[ "$2" != "-Dark" ]]; then
          cp $INPUT/common-files${size,,}/* $OUTPUT/
          cp $INPUT/assets/light-assets/* $OUTPUT/assets
          cp $INPUT/gtkrc$1 $OUTPUT/gtkrc
        else
          cp $INPUT/common-files${size,,}/* $OUTPUT/
          cp $INPUT/assets/dark-assets/* $OUTPUT/assets
          cp $INPUT/dark-variant-files/* $OUTPUT/
          cp $INPUT/gtkrc$1 $OUTPUT/gtkrc
        fi

        cp $INPUT/assets/common-assets/* $OUTPUT/assets
      done
    done
  done
done
