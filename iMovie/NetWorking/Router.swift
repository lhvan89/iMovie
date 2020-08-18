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
    case GetDashboardMenu
    
    var path: String {
        switch self {
        case .DashboadrList:
            return "trinhky/DashboardList"
        case .GetDashboardMenu:
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
    
    var headers: HTTPHeaders {
        
        var headers = ["Accept": "application/json; charset=utf-8"]
        headers["Token"] = "+pAo+OijHZigafP7jnHOA8xIDdvA7Q4FLAgH4NyEU/svH6UN5jHkFAE3CFNwVRnaNzcIW6pJYrGdIEcrLN5VYayA5ZhWdX+Yqg5RGc6qit5FLUhDCrAMCo4SzF1aBUy0X+YfhFFwJTtV3gpg9w30RulpSZDfWJy8f+8W377AvLkmRfqBRDvFHp9AGnZuMGbkAvUzpoC1Gt1xWLUnnoDNxgHK9fuV6VpU/hFOrAyytWk="
        headers["Content-Type"] = "application/json"
        headers["Lang"] = "vi-VN"
        headers["SiteUrl"] = "ttc"
        
        return headers
    }
    
    var parameters: Parameters {
        switch self {
        default:
            return [:]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)

        request.httpMethod = method.rawValue
        
        for (key, value) in headers {
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        return request
    }
}
