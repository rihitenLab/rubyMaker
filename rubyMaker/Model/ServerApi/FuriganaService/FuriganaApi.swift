//
//  FuriganaApi.swift
//  rubyMaker
//
//  Created by ri-matsuoka on 2019/04/14.
//  Copyright © 2019年 ri-matsuoka. All rights reserved.
//

import Foundation
import SWXMLHash
import os.log

struct FuriganaApiProperty: Codable {
    let url: String
    let appId: String
    
    func getUrl() -> URL? {
        return URL(string: url)
    }
}

class FuriganaApi: ServerApi {
    
    var apiProperty: FuriganaApiProperty? = nil
    
    init?() {
        if let path = Bundle.main.path(forResource: "FuriganaApi", ofType:"plist" ) {
            do {
                let data  = try Data(contentsOf: URL(fileURLWithPath: path))
                self.apiProperty = try PropertyListDecoder().decode(FuriganaApiProperty.self, from: data)
            } catch {
                os_log("Failed to getting properties from plist.", log: OSLog.default, type: .error)
                return nil
            }
        }
        
        guard let url = self.apiProperty?.getUrl() else {
            os_log("Failed to getting url from properties.", log: OSLog.default, type: .error)
            return nil
        }
        super.init(url: url)
    }
    
    func convertToFurigana(sentence: String, grade: Int?,
                           success: @escaping (String) -> Void, failure: @escaping (Error?) -> Void) {
        let request = FuriganaApiRequestEntity(appid: self.apiProperty?.appId ?? "", sentence: sentence, grade: grade)
        super.get(parameters: request.convToParameter(),
            success: { data in
                let xml = SWXMLHash.parse(data!)
                do {
                    let responseEntity: FuriganApiResponseEntity = try xml.value()
                    success(responseEntity.getFurigana())
                } catch {
                    failure(nil)
                }
            },
            failure: { error in
                failure(error)
            })
    }
}
