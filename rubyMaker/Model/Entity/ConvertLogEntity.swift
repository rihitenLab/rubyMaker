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
    @objc dynamic var id : Int64 = 0
    @objc dynamic var srcStr: String = ""
    @objc dynamic var convStr: String = ""
    @objc dynamic var createDate: Date = Date()
}

