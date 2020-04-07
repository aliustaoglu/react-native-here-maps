//
//  RNHMHereMapView.swift
//  RNHMReactNativeHereMaps
//
//  Created by Cuneyt Aliustaoglu on 16/03/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation
import NMAKit

class RNHMHereMapView : UIView, NMAMapViewDelegate{
    
    private var mapView : NMAMapView!
    private var isMapReady = false
    private var props = Props()
    
    
    // =========================================
    // PROPS start
    
    // Property Props Start
    @objc var camera: NSDictionary = [:] {
        didSet{
            props.camera = RNHMCamera(camera)
            if (self.isMapReady){
                props.camera?.update(mapView)
            }
        }
    }
    
    @objc var options: NSDictionary = [:] {
        didSet{
            props.options = RNHMOptions(options)
            if (self.isMapReady){
                props.options?.update(self.mapView)
            }
        }
    }
    
    @objc var mapStyle: NSDictionary = [:] {
        didSet{
            props.mapStyle = RNHMMapStyle(mapStyle)
            if (self.isMapReady){
                props.mapStyle?.update(self.mapView)
            }
        }
    }
    
    @objc var locationPicker: NSDictionary = [:] {
        didSet{
            if (props.locationPicker == nil) {
                props.locationPicker = RNHMLocationPicker(false)
            }
            if (self.isMapReady){
                props.locationPicker?.update(self.mapView, locationPicker)
            }
        }
    }
    
    @objc var markers: NSArray = [] {
        didSet{
            props.markers = RNHMMarkers(markers, oldValue)
            if (self.isMapReady){
                props.markers?.update(self.mapView)
            }
        }
    }
    
    @objc var polylines: NSArray = [] {
        didSet{
            props.polylines = RNHMPolylines(polylines, oldValue)
            if (self.isMapReady){
                props.polylines?.update(self.mapView)
            }
        }
    }
    // Property Props End
    
    // Event Props Start
    @objc var onMapReady: RCTDirectEventBlock?
    @objc var onCameraMove: RCTDirectEventBlock?
    @objc var onCameraMoveEnd: RCTDirectEventBlock?
    // Event Props End
    
    // PROPS End
    // =========================================
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func didMoveToWindow() {
        initMap()
    }
    
    func initMap() {
        mapView = NMAMapView()
        mapView.delegate = self
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        mapView.projectionType = .mercator
        
        self.addSubview(mapView)
        self.isMapReady = true
        
        self.props.refresh(mapView)
                
        if self.onMapReady != nil {
            self.onMapReady!([:])
        }
    }
    
    override func didSetProps(_ changedProps: [String]!) {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
