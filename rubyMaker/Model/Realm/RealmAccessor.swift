//
//  RealmAccessor.swift
//  rubyMaker
//
//  Created by ri-matsuoka on 2019/04/14.
//  Copyright © 2019年 ri-matsuoka. All rights reserved.
//

import Foundation
import RealmSwift

class RealmAccessor<T: Object> {
    
    typealias Entity = T
    
    var realm: Realm { return try! Realm() }
    
    init() {}
}
