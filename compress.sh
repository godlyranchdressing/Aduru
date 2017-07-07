#! /bin/bash
THEME="Aduru"
cd Compiled

for variant in '' '-Dark' '-Darker'; do
  cd $THEME${variant}
  tar -czf $THEME${variant}.tar.gz *
  mv $THEME${variant}.tar.gz ../..
  cd ..
done
