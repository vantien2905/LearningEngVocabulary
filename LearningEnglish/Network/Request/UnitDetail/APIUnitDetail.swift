//
//  APIUnitDetail.swift
//  LearningEnglish
//
//  Created by Felix Dinh on 1/9/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

import UIKit

enum APIUnitDetail {
    case getUnitDetail(idListUnit: String)
}

extension APIUnitDetail: TargetType {
    var baseURL: String {
        return baseUrlAPI
    }
    
    var path: String? {
        switch self {
        case .getUnitDetail(let id):
            return "api/v1/vocabularyofunit/\(id)"
        }
    }
    
    var method: HTTPMethod {
        return .get
   }
    
    var parameters: [String: Any]? {
        return nil
    }
    
    var parametersEncoding: ParameterEncoding? {
        return nil
    }
    
    var headers: [String: String]? {
        return nil
    }
}
