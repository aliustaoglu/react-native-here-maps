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
    

    func refresh(_ hereMapView: NMAMapView){
        self.camera?.update(hereMapView)
    }
}
