//
//  ConvertLogAccessor.swift
//  rubyMaker
//
//  Created by ri-matsuoka on 2019/04/14.
//  Copyright © 2019年 ri-matsuoka. All rights reserved.
//

import Foundation

class ConvertLogAccessor: RealmAccessor<ConvertlogEntity> {
    
    private let fileName: String = "Convertlog"
    
    init() {
        super.init(fileName: fileName)
    }
    
    func get(surface primaryKey: String) -> ConvertlogEntity? {
        return realm.object(ofType: ConvertlogEntity.self, forPrimaryKey: primaryKey)
    }
    
    func save(surface: String, furigana: String) {
        let entity = ConvertlogEntity()
        entity.surface = surface
        entity.furigana = furigana
        
        try! realm.write {
            realm.add(entity, update: true)
        }
    }
}
