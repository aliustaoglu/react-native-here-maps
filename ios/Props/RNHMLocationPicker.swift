//
//  RNHMLocationPicker.swift
//  RNHMReactNativeHereMaps
//
//  Created by Cuneyt Aliustaoglu on 7/04/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation
import NMAKit

struct RNHMLocationPicker{
    var isPickerEnabled = false
    var locationPickerView: UIView?
    var locationPickerViewImage: UIImageView!
    var mapPadding: NSArray?
    var markerPadding: NSArray?
    
    init(_ pickerEnabled:Bool){
        self.isPickerEnabled = pickerEnabled
    }
    
    public mutating func update(_ mapView: NMAMapView, _ locationPicker:NSDictionary){

    }
    
    public func update(_ mapView: NMAMapView){
        
    }
    
    private mutating func mountLocationPickerView(_ mapView: NMAMapView){

    }
    
    private func setCenter(_ mapView: NMAMapView){
        
    }
}
