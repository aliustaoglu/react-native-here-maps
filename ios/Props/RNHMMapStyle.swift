//
//  RNHMMapStyle.swift
//  RNHMReactNativeHereMaps
//
//  Created by Cuneyt Aliustaoglu on 7/04/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation
import NMAKit

struct RNHMMapStyle{
    var styleName = "DEFAULT"
    var buildings = false
    
    init(_ dict:NSDictionary){
        self.styleName = dict["styleName"] as! String
        self.buildings = dict["buildings"] as? Bool ?? false
    }
    
    public func update(_ mapView: NMAMapView){
        let style = getStyle()
        mapView.mapScheme = style
    }
    
    public func updateBuildings(style:NMAMapView){
        
    }
    
    public func getStyle() -> String {
        switch styleName {
        case "DARK":
            return NMAMapSchemeNormalNight
        case "LIGHT":
            return NMAMapSchemeNormalDay
        default:
            return NMAMapSchemeNormalDay
        }
        
    }
}
