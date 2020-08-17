//
//  Router.swift
//  iMovie
//
//  Created by Van Le on 8/13/20.
//  Copyright © 2020 Van Le. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    case DashboadrList
    case GetMenu
    
    var path: String {
        switch self {
        case .DashboadrList:
            return "trinhky/DashboardList"
        case .GetMenu:
            return "admin/LayMenu"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .post
        }
    }
    
    var baseURL: URL {
        return URL(string: "http://ttcapi.msm.com.vn/api/")!
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return request
    }
}
