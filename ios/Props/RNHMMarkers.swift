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
    var removedIDs: [String] = []
    
    var markerObjects: [String: NMAMapObject] = [:]
    
    init(_ markers: NSArray, _ oldValue: NSArray) {
        self.markers = markers
        self.oldMarkers = oldValue
        
        
        self.oldMarkers.forEach{ oldMarker in
            let oldDic = oldMarker as! NSDictionary
            let id = oldDic.object(forKey: "id") as! String
            let containsId = markers.contains { m in
                let marker = m as! NSDictionary
                let containsId = id == (marker.object(forKey: "id") as! String)
                return containsId
            }
            if !containsId {
                self.removedIDs.append(id)
            }
        }
    }
    
    public func update(_ mapView: NMAMapView, _ propsState: inout PropsStateType){
        for m in self.markers {
            let mDict = m as! NSDictionary
            let id = mDict.object(forKey: "id") as! String
            let lat = mDict.object(forKey: "lat") as! Double
            let lng = mDict.object(forKey: "lng") as! Double
            
            let coords = NMAGeoCoordinates(latitude: lat, longitude: lng)
            
            if let ico = mDict.object(forKey: "icon") {
                let icon = ico as? NSDictionary
                
                let uri = icon?.object(forKey: "uri") as! String
                let scale = icon?.value(forKey: "scale") as! CGFloat
                
                let url = URL(string: uri)
                let data = try? Data(contentsOf: url!)
                let img = UIImage(data: data!, scale: scale)!
                
                let marker = NMAMapMarker(geoCoordinates: coords, image: img)
                mapView.add(mapObject: marker)
                propsState["markers"]![id] = marker
            } else {
                let defaultMarker = NMAMapMarker(geoCoordinates: coords)
                mapView.add(mapObject: defaultMarker)
                propsState["markers"]![id] = defaultMarker
            }
        }
        
        removeMarkers(mapView, &propsState)
    }
    
    private func removeMarkers(_ mapView: NMAMapView, _ propsState: inout PropsStateType){
        self.removedIDs.forEach{ removedID in
            print(propsState)
            let mapObject = propsState["markers"]![removedID] as! NMAMapObject
            mapView.remove(mapObject: mapObject)
        }
        self.removedIDs = []
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

