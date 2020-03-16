//
//  RNHMHereMapView.swift
//  RNHMReactNativeHereMaps
//
//  Created by Cuneyt Aliustaoglu on 16/03/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation
import NMAKit

class RNHMHereMapView : UIView{
    
    private var hereMapView : NMAMapView!
    private var isMapReady = false
    private var props = Props()
    
    
    @objc var camera: NSDictionary = [:] {
        didSet{
            props.camera = RNHMCamera(camera)
            if (self.isMapReady){
                props.camera?.update(hereMapView)
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func didMoveToWindow() {
        initMap()
    }
    
    func initMap() {
        hereMapView = NMAMapView()
        hereMapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        hereMapView.projectionType = .mercator
        
        self.addSubview(hereMapView)
        self.isMapReady = true
        
        self.props.refresh(hereMapView)
    }
    
    override func didSetProps(_ changedProps: [String]!) {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
