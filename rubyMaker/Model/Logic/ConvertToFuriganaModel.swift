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
        let convertLogAccessor = ConvertLogAccessor()
        
        let onSuccess: (String) -> Void = {
            furigana in
            
            convertLogAccessor.save(surface: sentence, furigana: furigana)
            
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
        
        if let converLogEntity = convertLogAccessor.get(surface: sentence) {
            onSuccess(converLogEntity.furigana)
            return
        }
        
        let api = FuriganaApi()
        api?.convertToFurigana(sentence: sentence, grade: 1, success: onSuccess, failure: onFailure)
    }
    
    
}
