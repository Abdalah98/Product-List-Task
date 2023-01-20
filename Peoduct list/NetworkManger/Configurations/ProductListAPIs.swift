//
//  ProductListAPIs.swift
//  Peoduct list
//
//  Created by Bedo on 20/01/2023.
//

import Foundation

import Foundation
import Moya

enum ProductListAPIs {
    case getProductList

}


extension ProductListAPIs : TargetType {
    
    var baseURL: URL {
        return URL(string: "https://dummyjson.com")!
    }
    
    
    var path: String {
        switch self {
        case .getProductList:
            return "/products"
        }
    }
    
    
    var method: Moya.Method {
        switch self {
        case .getProductList:
            return .get
        }
    }
    
    
    var sampleData: Data {
        return Data()
    }
    
    
    var task: Task {
        switch self {
        case .getProductList:
            return .requestPlain
        }
    }
    
    
    var headers: [String : String]? {
        switch self {
        default:
            return [
                "Content-Type": "application/json",
                "Accept": "application/json",
                "Authorization": "Bearer"
            ]
        }
    }
}
