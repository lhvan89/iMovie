//
//  UIButton+Ext.swift
//  iMovie
//
//  Created by Van Le on 8/3/20.
//  Copyright © 2020 Van Le. All rights reserved.
//

import UIKit

public extension UIButton {
    
    @IBInspectable
    var localizedKey: String {
        set {
            self.setTitle(newValue.localized(), for: .normal)
        }
        get {
            return self.localizedKey
        }
    }
    
}
