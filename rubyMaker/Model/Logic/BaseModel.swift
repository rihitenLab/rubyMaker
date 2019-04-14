//
//  BaseModel.swift
//  rubyMaker
//
//  Created by ri-matsuoka on 2019/04/14.
//  Copyright © 2019年 ri-matsuoka. All rights reserved.
//

import Foundation

protocol BaseModelDelegate {
    var className: String { get }
}

class BaseModel<modelProtocl> {
    var delegates: [String: modelProtocl] = [:]
    
    func addDelegate(className: String, delegate: modelProtocl) {
        self.delegates[className] = delegate
    }
    
    func removeDelegate(className: String) {
        self.delegates.removeValue(forKey: className)
    }
}
