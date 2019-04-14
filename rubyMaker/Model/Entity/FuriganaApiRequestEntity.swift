//
//  FuriganaRequest.swift
//  rubyMaker
//
//  Created by ri-matsuoka on 2019/04/14.
//  Copyright © 2019年 ri-matsuoka. All rights reserved.
//

import Foundation

struct FuriganaApiRequestEntity: ApiRequestEntity {
    let appid: String
    let sentence: String
    let grade: Int?
    
    init(appid: String, sentence: String, grade: Int? = nil) {
        self.appid = appid
        self.sentence = sentence
        self.grade = grade
    }
    
    func convToParameter() -> [String : Any] {
        var parameter: [String:Any] = [:]
        parameter["appid"] = appid
        parameter["sentence"] = sentence
        if let _ = grade {
            parameter["grade"] = grade!
        }
        return parameter
    }
}
