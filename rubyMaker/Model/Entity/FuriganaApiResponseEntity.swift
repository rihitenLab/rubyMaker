//
//  FuriganaResponse.swift
//  rubyMaker
//
//  Created by ri-matsuoka on 2019/04/14.
//  Copyright © 2019年 ri-matsuoka. All rights reserved.
//

import Foundation
import SWXMLHash

struct FuriganApiResponseEntity: XMLIndexerDeserializable {
    let words: [Word]
    
    static func deserialize(_ node: XMLIndexer) throws -> FuriganApiResponseEntity {
        return try FuriganApiResponseEntity(
            words: node["ResultSet"]["Result"]["WordList"]["Word"].value()
        )
    }
    
    func getFurigana() -> String {
        var furigana: String = ""
        for word in words {
            furigana.append(contentsOf: word.furigana ?? word.surface)
        }
        return furigana
    }
}

struct Word: XMLIndexerDeserializable {
    let surface: String
    let furigana: String?
    let roman: String?
    
    static func deserialize(_ node: XMLIndexer) throws -> Word {
        return try Word(
            surface: node["Surface"].value(),
            furigana: node["Furigana"].value(),
            roman: node["Roman"].value()
        )
    }
    
}
