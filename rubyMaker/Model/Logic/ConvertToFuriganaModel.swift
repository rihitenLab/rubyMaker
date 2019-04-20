//
//  ConvertToFurigana.swift
//  rubyMaker
//
//  Created by ri-matsuoka on 2019/04/14.
//  Copyright © 2019年 ri-matsuoka. All rights reserved.
//

import Foundation

protocol ConvertToFuriganaDelegate {
    func onSuccess(furigana: String)
    func onFailure(error: Error?)
}

class ConvertToFuriganaModel: BaseModel<ConvertToFuriganaDelegate> {
    
    func convertToFurigana(sentence: String) {
        let onSuccess: (String) -> Void = {
            furigana in
            for (_, delegate) in super.delegates {
                delegate.onSuccess(furigana: furigana)
            }
        }
        
        let onFailure: (Error?) -> Void = {
            error in
            for (_, delegate) in super.delegates {
                delegate.onFailure(error: error)
            }
        }
        
        let api = FuriganaApi()
        api?.convertToFurigana(sentence: sentence, grade: 1, success: onSuccess, failure: onFailure)
    }
    
    
}
