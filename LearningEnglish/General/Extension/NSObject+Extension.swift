//
//  NSObject+Extension.swift
//  LearningEnglish
//
//  Created by Tien Dinh on 11/5/17.
//  Copyright © 2017 Tien Dinh. All rights reserved.
//

import Foundation
public extension NSObject {
    class var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last! as String
    }
}
