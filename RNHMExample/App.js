import React, {Component} from 'react'
import {Platform, StyleSheet, Text, View, ScrollView, Image} from 'react-native'
import Simple from './src/Screens/Simple'
import Btn from './src/Btn'
import Markers from './src/Screens/Markers'
import bus from './src/assets/bus.png'

export default class App extends Component {
  constructor(props) {
    super(props)
    this.state = {
      activeRoute: 'App'
    }
    this.onBtnClick = this.onBtnClick.bind(this)
  }

  onBtnClick(activeRoute) {
    this.setState({activeRoute})
  }

  render() {
    const route = this.state.activeRoute
    return (
      <>
        {this.state.activeRoute === 'App' && (
          <View style={{marginTop: 50, height: '100%'}}>
            <ScrollView>
              <Btn text="Simple" onClick={() => this.onBtnClick('Simple')} />
              <Btn text="Markers" onClick={() => this.onBtnClick('Markers')} />
              <Image source={bus} />
            </ScrollView>
          </View>
        )}
        {route === 'Simple' && <Simple onGoBack={() => this.setState({activeRoute: 'App'})} />}
        {route === 'Markers' && <Markers onGoBack={() => this.setState({activeRoute: 'App'})} />}
      </>
    )
  }
}
