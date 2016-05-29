import React from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  Image
} from 'react-native';
import RNOpenCV from '..';
import testimage from 'assets/TestImage.jpg';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center'
  },
  image: {
    width: 200,
    height: 200
  }
});

class QCards extends React.Component {

  state = {
    image: testimage
  };

  componentDidMount() {
    RNOpenCV.makeGrayscale(this.state.image, grayscale => {
      this.setState({
        image: grayscale
      })
    });  
  }

  render() {
    return (
      <View style={styles.container}>
        <Image style={styles.image} 
               source={{uri : this.state.image}}/>
        <Text>Done :D</Text>
      </View>
    )
  }
}

AppRegistry.registerComponent('RNOpenCVTest', () => QCards);