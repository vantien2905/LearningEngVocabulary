//
//  ListUnit.swift
//  LearningEnglish
//
//  Created by Tu DV on 1/9/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

import ObjectMapper
import RealmSwift

class LEVUnit: Object, Mappable {
    
    @objc dynamic var idUnit: String?
    @objc dynamic var idWordBook: String?
    @objc dynamic var nameUnit: String?
    @objc dynamic var urlUnit: String?
    var score = RealmOptional<Int>(nil)
    
    // offline
    @objc dynamic var urlUnitLocal: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "idUnit"
    }
    
    func mapping(map: Map) {
        self.idUnit <- map["idUnit"]
        self.idWordBook <- map["idWordBook"]
        self.nameUnit <- map["nameUnit"]
        self.score <- map["score"]
        self.urlUnit <- map["urlUnit"]
    }
    
    // init to get image offline
    convenience init(idUnit: String?, idWordBook: String?, nameUnit: String?, urlUnit: String?, score: Int?) {
        self.init()
        self.idUnit = idUnit
        self.idWordBook = idWordBook
        self.nameUnit = nameUnit
        self.urlUnit = urlUnit
        self.score.value = score
        
        let urlImage = FileManagerHelper.shared.imagesFolder.appendingPathComponent("\(idUnit&).jpg")
        if FileManagerHelper.shared.checkExistFile(url: urlImage) {
            urlUnitLocal = urlImage.absoluteString
        }
    }
}
