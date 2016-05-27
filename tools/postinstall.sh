#!/bin/bash
echo '### Installing Pod Dependencies ###'
cd src/ios && pod install
echo '### Linking Configurations ###'
ln -s `pwd`/Pods/Target\ Support\ Files/Pods-RNOpenCV/Pods-RNOpenCV.debug.xcconfig RNOpenCV.debug.xcconfig
ln -s `pwd`/Pods/Target\ Support\ Files/Pods-RNOpenCV/Pods-RNOpenCV.release.xcconfig RNOpenCV.release.xcconfig
echo '### Done ###'