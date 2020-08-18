//
//  DashboardMenuModel.swift
//  iMovie
//
//  Created by Van Le on 8/18/20.
//  Copyright © 2020 Van Le. All rights reserved.
//

import Foundation
import ObjectMapper

class DashboardMenuModel: Mappable {
    var AllMenu: [DashboardMenuItemModel] = []
    var MenuGroup: [DashboardMenuGroupModel] = []
    var NotifyCount: Int = 0
    var CongTy = CongTyModel()
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.AllMenu        <- map["AllMenu"]
        self.MenuGroup      <- map["MenuGroup"]
        self.NotifyCount    <- map["NotifyCount"]
        self.CongTy         <- map["CongTy"]
    }
}

class DashboardMenuItemModel: Mappable {
    var Id: Int = 0
    var Group: String = ""
    var WebUrl: String = ""
    var Key: String = ""
    var Title: String = ""
    var Tasks: Int = 0
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.Id     <- map["ID"]
        self.Group  <- map["Group"]
        self.WebUrl <- map["WebUrl"]
        self.Key    <- map["Key"]
        self.Title  <- map["Title"]
        self.Tasks  <- map["Tasks"]
    }
}

class DashboardMenuGroupModel: Mappable {
    var Group: String = ""
    var Menu: [DashboardMenuItemModel] = []
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.Group  <- map["Group"]
        self.Menu   <- map["Menu"]
    }
}

class CongTyModel: Mappable {

    var SiteUrl: String = ""
    var Edition: String = ""
    var Title: String = ""
    var Logo: String = ""
    var Ma: String = ""
    var IsDefault: Bool = false
    
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        self.SiteUrl    <- map["SiteUrl"]
        self.Edition    <- map["Edition"]
        self.Title      <- map["Title"]
        self.Logo       <- map["Logo"]
        self.Ma         <- map["Ma"]
        self.IsDefault  <- map["IsDefault"]
    }
}
