//
//  APIListUnit.swift
//  LearningEnglish
//
//  Created by Tu DV on 1/9/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

import UIKit

enum APIListUnit {
    case getAllListUnit(idWordBook: String)
}

extension APIListUnit: TargetType {
    var baseURL: String {
        return baseUrlAPI
    }
    
    var path: String? {
        switch self {
        case .getAllListUnit(let id):
            return "api/v1/unitofwordbook/\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAllListUnit(_):
            return .get //FIXME when have method
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getAllListUnit(_):
            return [:]
        }
    }
    
    var parametersEncoding: ParameterEncoding? {
        switch self {
        case .getAllListUnit(idWordBook: _):
            return nil
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getAllListUnit(_):
            return [:]
        }
    }
}
