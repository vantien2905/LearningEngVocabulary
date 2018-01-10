//
//  ListUnit.swift
//  LearningEnglish
//
//  Created by Tu DV on 1/9/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

import ObjectMapper

class LEVUnit: Mappable {
    
    var idUnit: String?
    var idWordBook: String?
    var nameUnit: String?
    var score: Int?
    var urlUnit: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.idUnit <- map["idUnit"]
        self.idWordBook <- map["idWordBook"]
        self.nameUnit <- map["nameUnit"]
        self.score <- map["score"]
        self.urlUnit <- map["urlUnit"]
    }
  
}
