//
//  RNHMOptions.swift
//  RNHMReactNativeHereMaps
//
//  Created by Cuneyt Aliustaoglu on 7/04/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation
import NMAKit

struct RNHMOptions {
    var mapView: NMAMapView!
    var showsUserHeadingIndicator: Bool!
    var showsScale: Bool!
    var showsHeading: Bool!
    var showsUserLocation: Bool!
    
    init(_ dict:NSDictionary){
        let options = dict as! Dictionary<String, Bool>
        
        self.showsUserHeadingIndicator = options["showsUserHeadingIndicator"] ?? false
        self.showsScale = options["showsScale"] ?? false
        self.showsHeading = options["showsHeading"] ?? false
        self.showsUserLocation = options["showsUserLocation"] ?? false
    }
    
    public func update(_ mapView: NMAMapView){
        
    }
}
