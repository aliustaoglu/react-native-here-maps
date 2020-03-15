import React, {Component} from 'react'
import {Button, View, Image} from 'react-native'
import RNHMReactNativeHereMaps from 'react-native-here-maps'
import {commonStyles} from '../styles'
import bus from '../assets/bus.png'

export default class Markers extends Component {
  constructor(props) {
    super(props)
    this.state = {
      camera: {
        target: {
          lat: -36.8485,
          lng: 174.7633
        },
        zoom: 10
      },
      markers: [
        {
          id: 'Marker1',
          lat: -36.8485,
          lng: 174.7633,
          title: 'Custom',
          subtitle: 'Sub1',
          icon: Image.resolveAssetSource(bus),
          pulsator: {
            color: '#ff00ff',
            radius: 20,
            duration: 1500
          }
        }
      ]
    }
  }

  render() {
    return (
      <>
        <RNHMReactNativeHereMaps style={{flex: 1}} camera={this.state.camera} markers={this.state.markers} />
        <View style={commonStyles.backButton}>
          <Button title="<Back" onPress={this.props.onGoBack} />
        </View>
      </>
    )
  }
}
