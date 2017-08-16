#! /bin/bash
THEME="Aduru"
cd Compiled

for buttons in '' '-osx'; do
for variant in '' '-Dark' '-Darker'; do
  for size in '' '-Compact'; do
  cd $THEME${buttons^^}${variant}${size}
  tar -czf $THEME${buttons^^}${variant}${size}.tar.gz *
  mv $THEME${buttons^^}${variant}${size}.tar.gz ../..
  cd ..
done
done
done
