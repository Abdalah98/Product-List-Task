//
//  ProductListConnectors.swift
//  Peoduct list
//
//  Created by Bedo on 20/01/2023.
//

import Foundation

class ProductListConnectors: API_Provider<ProductListAPIs> {
    
    func getProductListInfo(onSuccess: @escaping (_ productListInfo: ProductListInfo) -> Void,
                    onfailure: @escaping (_ message: String) -> Void) {
        request(modelType: ProductListInfo.self,
                target: .getProductList) { (result) in
            switch result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onfailure(error.errorDescription)
            }
        }
    }

}
