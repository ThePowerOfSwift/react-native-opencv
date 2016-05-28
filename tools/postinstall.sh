#!/bin/bash
echo '### Installing Pod Dependencies ###'
cd src/ios && pod install
echo '### Linking Configurations ###'
rm RNOpenCV.debug.xcconfig
rm RNOpenCV.release.xcconfig
cp  ./Pods/Target\ Support\ Files/Pods-RNOpenCV/Pods-RNOpenCV.debug.xcconfig RNOpenCV.debug.xcconfig
cp  ./Pods/Target\ Support\ Files/Pods-RNOpenCV/Pods-RNOpenCV.release.xcconfig RNOpenCV.release.xcconfig
echo '### Done ###'