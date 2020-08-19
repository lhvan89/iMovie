//
//  TapMenuModel.swift
//  iMovie
//
//  Created by Van Le on 8/19/20.
//  Copyright © 2020 Van Le. All rights reserved.
//

import Foundation
import ObjectMapper

class TapMenuModel: Mappable {
    var ID: Int = 0
    var Title: String = ""
    var Key: String = ""
    var Value: String = ""
    var Count: String = ""
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.ID <- map["ID"]
        self.Title <- map["Title"]
        self.Key <- map["Key"]
        self.Value <- map["Value"]
        self.Count <- map["Count"]
    }
}
