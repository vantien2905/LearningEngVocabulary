//
//  WordBook.swift
//  LearningEnglish
//
//  Created by Kai Pham on 1/6/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

import ObjectMapper

class WordBook: Mappable {
    
    var idWordBook: String?
    var nameWordBook: String?
    var urlWordBook: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.idWordBook <- map["idWordBook"]
        self.nameWordBook <- map["nameWordBook"]
        self.urlWordBook <- map["urlWordBook"]
    }
}
