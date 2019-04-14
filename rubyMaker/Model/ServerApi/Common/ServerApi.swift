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
    
    func get(parameters:[String : Any],
                      success: @escaping (Data?) -> Void, failure: @escaping (Error) -> Void) {
        Alamofire.request(url, method: .get, parameters: parameters).validate(statusCode: 200..<300).responseData() {
            response in
            switch response.result {
            case .success:
                success(response.data)
            case .failure(let error):
                failure(error)
            }
        }
    }
    
}
