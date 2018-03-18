//
//  Vocabulary.swift
//  LearningEnglish
//
//  Created by Felix Dinh on 1/9/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

import ObjectMapper
import RealmSwift

class Vocabulary: Object, Mappable {
   @objc dynamic var num: Int = 0
   @objc dynamic var english: String?
   @objc dynamic var vnRaw: String?
   @objc dynamic var example: String?
   @objc dynamic var vietnamese: String?
   @objc dynamic var idUnit: String?
   @objc dynamic var thumbUrl: String?
   @objc dynamic var voice: String?
    
    @objc dynamic var thumbUrlLocal: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "num"
    }
    
    func mapping(map: Map) {
        num <- map["stt"]
        english <- map["english"]
        vnRaw <- map["vnRaw"]
        example <- map["example"]
        vietnamese <- map["vietnamese"]
        idUnit <- map["idUnit"]
        thumbUrl <- map["thumbUrl"]
        voice <- map["voice"]
    }
    
    convenience init(num: Int, english: String?, vnRaw: String?, example: String?, vietnamese: String?, idUnit: String?, thumbUrl: String?, voice: String?) {
        self.init()
        self.num = num
        self.english = english
        self.vnRaw = vnRaw
        self.example = example
        self.vietnamese = vietnamese
        self.idUnit = idUnit
        self.thumbUrl = thumbUrl
        self.voice = voice
        
        let urlImage = FileManagerHelper.shared.imagesFolder.appendingPathComponent("\(english&).jpg")
        if FileManagerHelper.shared.checkExistFile(url: urlImage) {
            thumbUrlLocal = urlImage.absoluteString
        }
    }
    
}
