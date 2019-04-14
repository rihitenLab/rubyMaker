//
//  ServerApi.swift
//  rubyMaker
//
//  Created by ri-matsuoka on 2019/04/14.
//  Copyright © 2019年 ri-matsuoka. All rights reserved.
//

import Foundation
import Alamofire

class ServerApi {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    internal func get(parameters:[String : Any],
                      comoleted: ((DataResponse<Data>) -> Void)?) {
        Alamofire.request(url, method: .get, parameters: parameters).validate(statusCode: 200..<300).responseData() {
            response in
            comoleted?(response)
        }
    }
    
}
