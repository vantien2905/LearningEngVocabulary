//
//  WordBook.swift
//  LearningEnglish
//
//  Created by Kai Pham on 1/6/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

import ObjectMapper
import RealmSwift

class WordBook: Object, Mappable {
    
    @objc dynamic var idWordBook: String?
    @objc dynamic var nameWordBook: String?
    @objc dynamic var urlWordBook: String?
    
    // offline
    @objc dynamic var urlImageLocal: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "idWordBook"
    }
    
    func mapping(map: Map) {
        self.idWordBook <- map["idWordBook"]
        self.nameWordBook <- map["nameWordBook"]
        self.urlWordBook <- map["urlWordBook"]
    }
}
