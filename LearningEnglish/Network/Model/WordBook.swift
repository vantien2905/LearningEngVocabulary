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
    
    // init to get image offline
    convenience init(idWordBook: String?, nameWordBook: String?, urlWordBook: String?) {
        self.init()
        self.idWordBook = idWordBook
        self.nameWordBook = nameWordBook
        self.urlWordBook = urlWordBook
        
        let urlImage = FileManagerHelper.shared.imagesFolder.appendingPathComponent("\(idWordBook&).jpg")
        if FileManagerHelper.shared.checkExistFile(url: urlImage) {
            urlImageLocal = urlImage.absoluteString
        }
    }
}
