//
//  APIWordBook.swift
//  LearningEnglish
//
//  Created by Kai Pham on 1/6/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

import UIKit

enum APIWordbook {
    case getAllWordBook()
}

extension APIWordbook: TargetType {
    var baseURL: String {
        return baseUrlAPI
    }
    
    var path: String? {
        return "api/v1/wordbook"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: [String : Any]? {
        return nil
    }
    
    var parametersEncoding: ParameterEncoding? {
        return nil
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
