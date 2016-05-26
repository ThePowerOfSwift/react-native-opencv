[WIP] React-native-opencv (IOS only)

In Development

to try copy the folder to node_modules and from root of your project

`cd node_modules/react-native-opencv/src/ios && pod install && open RNOpenCV.xcworkspace`
  1) In Node Modules Project
    - Select RNOpenCV target
    - Remove libPods-RNOpencv from (Link Binary with Libraries in Build Phases)
  2) In your project in Link Binary with Libraries in Build Phases
    - Add RNOpenCV.xcodeproj from node_modules/react-native-opencv/src/ios
    - Add Pod.xcodeproj from node_modules/react-native-opencv/src/ios/Pod/
   
// ` //rnpm link`
