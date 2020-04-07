//
//  RNHMPolylines.swift
//  RNHMReactNativeHereMaps
//
//  Created by Cuneyt Aliustaoglu on 7/04/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation
import NMAKit

class RNHMPolylines {
    let polylines: NSArray!
    let oldPolylines: NSArray!
    var mapView: NMAMapView!
    var removedIDs: [String] = []
    
    
    init(_ polylines: NSArray, _ oldValue: NSArray) {
        self.polylines = polylines
        self.oldPolylines = oldValue
        
        
    }
    
    public func update(_ mapView: NMAMapView){
        self.mapView = mapView
        
    }
    
}
