//
//  Router.swift
//  iMovie
//
//  Created by Van Le on 8/13/20.
//  Copyright © 2020 Van Le. All rights reserved.
//

import Foundation

protocol Router: URLRequestConvertible {
    static var baseURLString: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var headers: HTTPHeaders { get }
    var timeOut: TimeInterval { get }
    func asURLRequest() throws -> URLRequest
}

extension Router {
    
    static var baseURLString : String {
        return "http://ttcapi.msm.com.vn/api/"
    }
    
    var defaultHeaders: HTTPHeaders {
        var headers = ["Accept": "application/json; charset=utf-8", "Content-Type": "application/json"]
        headers["Lang"] = Localize.currentLanguage() == "en" ? "en-US" : "vi-VN"
        headers["SiteUrl"] = "ttc"
        headers["Token"] = "+pAo+OijHZigafP7jnHOA8xIDdvA7Q4FLAgH4NyEU/svH6UN5jHkFAE3CFNwVRnaNzcIW6pJYrGdIEcrLN5VYayA5ZhWdX+Yqg5RGc6qit5FLUhDCrAMCo4SzF1aBUy0X+YfhFFwJTtV3gpg9w30RulpSZDfWJy8f+8W377AvLkmRfqBRDvFHp9AGnZuMGbkAvUzpoC1Gt1xWLUnnoDNxgHK9fuV6VpU/hFOrAyytWk="
        return headers
    }
    
    var defaultTimeOut: TimeInterval {
        return 40
    }
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        return .post
    }
    
    var headers: HTTPHeaders {
        return self.defaultHeaders
    }
    
    var timeOut: TimeInterval {
        return self.defaultTimeOut
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try Self.baseURLString.asURL()
        
        // setting path
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))

        // setting method
        urlRequest.httpMethod = method.rawValue
        
        // setting header
        for (key, value) in headers {
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        // setting params
        if let parameters = parameters {
            if method == .get {
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            } else {
                urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
            }
        }
        
        urlRequest.timeoutInterval = timeOut
        
        return urlRequest
    }
}
