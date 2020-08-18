//
//  BaseResponse.swift
//  iMovie
//
//  Created by Van Le on 8/18/20.
//  Copyright © 2020 Van Le. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseResponse<T: Mappable>: Mappable {
    var Title: String = ""
    var Result: T?
    var Status = StatusModel()
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.Title  <- map["Title"]
        self.Result <- map["Result"]
        self.Status <- map["Status"]
    }
}

class StatusModel: Mappable {
    var Code: Int = 0
    var Desc: String = ""
    
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.Code   <- map["Code"]
        self.Desc   <- map["Desc"]
    }
}
