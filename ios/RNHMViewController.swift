//
//  RNHMViewController.swift
//  RNHMReactNativeHereMaps
//
//  Created by Cüneyt Aliustaoğlu on 15/03/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation
import NMAKit

@objc(RNHMReactNativeHereMaps)
class RNHMReactNativeHereMaps: RCTViewManager {
    
    
    override func view() -> UIView? {
        let view = UITextView()
        view.text = "DENEME"
        return view
    }
    
}
