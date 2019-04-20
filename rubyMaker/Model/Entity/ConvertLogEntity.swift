//
//  ConvertLog.swift
//  rubyMaker
//
//  Created by ri-matsuoka on 2019/04/14.
//  Copyright © 2019年 ri-matsuoka. All rights reserved.
//

import Foundation
import RealmSwift

class ConvertlogEntity: Object {
    @objc dynamic var surface: String = ""
    @objc dynamic var furigana: String = ""
    @objc dynamic var createDate: Date = Date()
    
    override static func primaryKey() -> String? {
        return "surface"
    }
}

