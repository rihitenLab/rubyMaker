//
//  ApiRequestEntity.swift
//  rubyMaker
//
//  Created by ri-matsuoka on 2019/04/14.
//  Copyright © 2019年 ri-matsuoka. All rights reserved.
//

import Foundation

protocol ApiRequestEntity {
    func convToParameter() -> [String : Any]
}
