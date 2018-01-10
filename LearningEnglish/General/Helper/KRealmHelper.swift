//
//  KRealmHelper.swift
//  LearningEnglish
//
//  Created by Kai Pham on 1/8/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

import Foundation
import RealmSwift

class KRealmHelper {
    static let shared = KRealmHelper()
    
    let realm = try! Realm()
    
    // MARK: CRUD functions
    func dbCreateObject(_ object: Object) {
        do {
            try realm.write {
                self.realm.add(object)
            }
        } catch {
            print("Error saving")
        }
    }
    
    func dbDeleteAll() {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    func dbUpdateObject(_ updateBlock: (() -> Void)) {
        try! realm.write {
            updateBlock()
        }
    }
    
    func dbUpdateWithRealm(_ updateBlock: @escaping ((_ realm: Realm) -> Void)) {
        try! realm.write {
            updateBlock(self.realm)
        }
    }
    
    func dbDeleteObject(_ object: Object) {
        try! realm.write {
            self.realm.delete(object)
        }
    }
    
    func dbDeleteObjects<T: Object>(_ objects: Array<T>) {
        try! realm.write {
            self.realm.delete(objects)
        }
    }
    
    func dbAddObject(_ object: Object, update: Bool = false) {
        try! realm.write {
            self.realm.add(object, update: update)
        }
    }
    
    func dbAddObjects(_ objects: [Object], update: Bool = false) {
        try! realm.write {
            self.realm.add(objects, update: update)
        }
    }
    
    func dbObjects<T: Object>(_ type: T.Type) -> Results<T> {
        return realm.objects(type)
    }
}

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        
        return array
    }
}
