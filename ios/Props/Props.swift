//
//  Props.swift
//  RNHMReactNativeHereMaps
//
//  Created by Cüneyt Aliustaoğlu on 15/03/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation
import NMAKit

struct Props {
    var camera: RNHMCamera?
    var markers: RNHMMarkers?
    var options: RNHMOptions?
    var mapStyle: RNHMMapStyle?
    var locationPicker: RNHMLocationPicker?
    var polylines: RNHMPolylines?

    func refresh(_ mapView: NMAMapView, _ propsState: inout PropsStateType){
        self.camera?.update(mapView)
        self.markers?.update(mapView, &propsState)
        self.options?.update(mapView)
        self.mapStyle?.update(mapView)
        self.locationPicker?.update(mapView)
        self.polylines?.update(mapView)
    }
}

import Foundation
