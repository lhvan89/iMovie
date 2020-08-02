//
//  UILabel+Ext.swift
//  iMovie
//
//  Created by Van Le on 8/3/20.
//  Copyright © 2020 Van Le. All rights reserved.
//

import UIKit

public extension UILabel {
    
    @IBInspectable
    var localizedKey: String {
        set {
            self.text = newValue.localized()
        }
        get {
            return self.localizedKey
        }
    }
    
}
