//
//  APIClient.swift
//  iMovie
//
//  Created by Van Le on 8/18/20.
//  Copyright © 2020 Van Le. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

class APIClient {
    static func requestObject<T: Mappable>(_ router: Router, _ type: T.Type, completionHandler: @escaping ((_ result: T?) -> Void)) {
        Alamofire.request(router).responseObject { (response: DataResponse<BaseResponse<T>>) in
            self.printResponse(request: response.request, data: response.data!)
            switch response.result {
            case .success( let data):
                guard let status = data.Status as? StatusModel else { return }
                switch status.Code {
                    case 200:
                        completionHandler(data.Result)
                    default:
                        print(status.Desc)
                        completionHandler(nil)
                }
                
            case .failure(let error):
                print(error)
                completionHandler(nil)
            }
        }
    }
    
    fileprivate static func printResponse(request: URLRequest?, data: Data) {
        #if DEBUG
        print("====================")
        if let request = request, let header = request.allHTTPHeaderFields {
            print("url =",  String(describing: request))
            print("headers =", String(describing: header))
        }
        if let data = request?.httpBody {
            print("parameters =", String(decoding: data, as: UTF8.self))
        }
        if let dataJson = String(data: data, encoding: .utf8), let jsonResponse = dataJson.data(using: .utf8)?.prettyPrintedJSONString {
            print("response =", jsonResponse)
        }
        print("====================")
        #endif
    }
}
