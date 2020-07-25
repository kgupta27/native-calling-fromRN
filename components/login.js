import React, { Component } from 'react'
import { NativeModules, View, Text, Button } from 'react-native'

export default class PDFView extends Component{

    onClick=()=>{
        console.log('Here');
        console.log(NativeModules);

        // For calling App delegate Function
        // NativeModules.AppDelegate.printMessage()

        // For calling cumstom message component Function
      var nativeModule = NativeModules.CustomMessage;
      nativeModule.printMessage();

    }

  render() {
    return (
        <View>
            <Text>Test</Text>
            <Button title="click here" onPress={()=> this.onClick()} />
        </View>
    );
  }
}