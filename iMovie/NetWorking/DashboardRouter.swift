//
//  DashboardRouter.swift
//  iMovie
//
//  Created by Van Le on 8/19/20.
//  Copyright © 2020 Van Le. All rights reserved.
//

import Foundation

enum DashBoardRouter: Router {
    
    case DashboardListTrinhKy(key: String, pagingInfo: String)
    case GetDashboardMenu
    
    var path: String {
        switch self {
        case .DashboardListTrinhKy:
            return "trinhky/DashboardList"
        case .GetDashboardMenu:
            return "admin/LayMenu"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .DashboardListTrinhKy(let key, let pagingInfo):
            return ["Key": key, "PagingInfo": pagingInfo]
            
        default:
            return [:]
        }
    }
}
