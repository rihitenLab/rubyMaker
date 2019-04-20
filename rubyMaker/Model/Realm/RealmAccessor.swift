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
    
    private var fileName: String!
    
    var realm: Realm {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let path = paths[0] + "/" + fileName + ".realm"
        let url = URL(fileURLWithPath: path)
        return try! Realm(fileURL: url)
    }
    
    init(fileName: String) {
        self.fileName = fileName
    }
}
