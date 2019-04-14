//
//  FuriganaApi.swift
//  rubyMaker
//
//  Created by ri-matsuoka on 2019/04/14.
//  Copyright © 2019年 ri-matsuoka. All rights reserved.
//

import Foundation
import SWXMLHash

class FuriganaApi: ServerApi {
    
    init() {
        super.init(url: URL(string: "https://jlp.yahooapis.jp/FuriganaService/V1/furigana")!)
    }
    
    func convertToFurigana(sentence: String, grade: Int?,
                           success: @escaping (String?) -> Void, failer: @escaping (Error) -> Void) {
        let request = FuriganaApiRequestEntity(appid: "", sentence: sentence, grade: grade)
        super.get(parameters: request.convToParameter()) {
            response in
            switch response.result {
            case .success :
                let xml = SWXMLHash.parse(response.data!)
                do {
                    let responseEntity: FuriganApiResponseEntity = try xml.value()
                    success(responseEntity.getFurigana())
                } catch {
                    // TODO: error
                }
            case .failure(let error) :
                // TODO: error
                break
            }
        }
    }
}
