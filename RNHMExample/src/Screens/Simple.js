import React, {Component} from 'react'
import {Button, View} from 'react-native'
import RNHMReactNativeHereMaps from 'react-native-here-maps'
import {commonStyles} from '../styles'

export default class Simple extends Component {
  constructor(props) {
    super(props)
    this.state = {
      camera: {
        target: {
          lat: -36.8485,
          lng: 174.7633
        },
        zoom: 10
      }
    }
  }

  render() {
    return (
      <>
        <RNHMReactNativeHereMaps style={{flex: 1}} camera={this.state.camera} />
        <View style={commonStyles.backButton}>
          <Button title="<Back" onPress={this.props.onGoBack} />
        </View>
      </>
    )
  }
}
