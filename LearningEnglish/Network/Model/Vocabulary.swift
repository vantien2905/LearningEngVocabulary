//
//  Vocabulary.swift
//  LearningEnglish
//
//  Created by Felix Dinh on 1/9/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

import ObjectMapper

class Vocabulary: Mappable {
    var stt: Int?
    var english: String?
    var vnRaw: String?
    var example: String?
    var vietnamese: String?
    var idUnit: String?
    var thumbUrl: String?
    var voice: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        stt <- map["stt"]
        english <- map["english"]
        vnRaw <- map["vnRaw"]
        example <- map["example"]
        vietnamese <- map["vietnamese"]
        idUnit <- map["idUnit"]
        thumbUrl <- map["thumbUrl"]
        voice <- map["voice"]
    }
}
