#! /bin/bash
THEME="Aduru"
cd Compiled

for variant in '' '-Dark' '-Darker'; do
  for size in '' '-Compact'; do
  cd $THEME${variant}${size}
  tar -czf $THEME${variant}${size}.tar.gz *
  mv $THEME${variant}${size}.tar.gz ../..
  cd ..
done
done
