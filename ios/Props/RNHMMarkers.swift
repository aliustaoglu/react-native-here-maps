//
//  RNHMMarkers.swift
//  RNHMReactNativeHereMaps
//
//  Created by Cüneyt Aliustaoğlu on 15/03/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation

import Foundation
import NMAKit

class RNHMMarkers{
    var markers: NSArray = []
    var oldMarkers: NSArray = []
    
    init(_ markers: NSArray, _ oldValue: NSArray) {
        self.markers = markers
        self.oldMarkers = oldValue
        
        
        
    }
    
    public func update(_ mapView: NMAMapView){
        
    }
    
    private func removeMarkers(_ mapView: NMAMapView){

    }
}

func hexStringToCGColor (hex:String) -> CGColor {
    return hexStringToUIColor(hex: hex).cgColor
}

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

