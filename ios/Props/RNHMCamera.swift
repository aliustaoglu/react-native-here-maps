//
//  RNHMCamera.swift
//  RNHMReactNativeHereMaps
//
//  Created by Cüneyt Aliustaoğlu on 15/03/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation
import NMAKit

struct RNHMCamera{
    struct Target {
        var lat: Double?
        var lng: Double?
    }
    
    var target: Target!
    var bearing: Float?
    var zoom: Float?
    var tilt: Float?
    
    init(_ dict:NSDictionary){
        let target = dict["target"] as! Dictionary<String, Double>
        self.target = Target(lat:target["lat"], lng: target["lng"])
        self.bearing = dict["bearing"] as? Float
        self.zoom = dict["zoom"] as? Float
        self.tilt = dict["tilt"] as? Float
    }
    
    func update(_ hereMapView: NMAMapView){
        if (self.tilt != nil) {
            hereMapView.set(tilt: self.tilt!, animation: NMAMapAnimation.none)
        }
        if (self.zoom != nil) {
            hereMapView.set(zoomLevel: self.zoom!, animation: NMAMapAnimation.none)
        }
        
        let geoCenter = NMAGeoCoordinates(latitude: self.target!.lat!, longitude: self.target!.lng!)
        hereMapView.set(geoCenter: geoCenter, animation: NMAMapAnimation.none)
        
    }
}
