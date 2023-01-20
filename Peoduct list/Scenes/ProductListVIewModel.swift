//
//  ProductListVIewModel.swift
//  Peoduct list
//
//  Created by Bedo on 20/01/2023.
//

import Foundation
class ProductListVIewModel {
   
    var selectedProduct: Product?

    private  var product = [Product]()
    
    private var interactor : ProductListConnectors = ProductListConnectors()

    private var cellViewModel : [ProductListCellVIewModel] = [ProductListCellVIewModel](){
        didSet{
            self.reloadTableViewClouser?()
        }
    }
    
    var reloadTableViewClouser :(()->())?
    var showAlertClosure: (()->())?
    var updateLoadingStatus: (()->())?

    
    //    // callback for interfaces

    var numberOfCell :Int {
        print(cellViewModel.count)
        return cellViewModel.count
    }
    
        var state: State = .empty {
            didSet {
                self.updateLoadingStatus?()
            }
        }
    
        var alertMessage: String? {
            didSet {
                self.showAlertClosure?()
            }
        }
     
    
    func initFetchData(){
        state = .loading
        interactor.getProductListInfo {[weak self] productListInfo in
            guard let self = self else{return}
            self.processFetchedBook(products: productListInfo.products ?? [])
            self.state = .populated
        } onfailure: {[weak self] message in
            guard let self = self else{return}
            self.state = .error
            self.alertMessage = message
        }
    }
    
    
    func getCellViewModel(at indexPath : IndexPath) -> ProductListCellVIewModel{
        return cellViewModel[indexPath.item]
    }
    
    func createCellViewModel( product: Product ) -> ProductListCellVIewModel {
        let title = product.title
        let description = product.description
        let thumbnail = product.thumbnail
        let price = product.price
        let category =  product.category
        let images = product.images

        return ProductListCellVIewModel(description: description ?? "", title: title ?? "", category: category ?? "", price: price ?? 0 , thumbnail: thumbnail ?? "" , images: images ?? [])
    }
    
    private func processFetchedBook( products: [Product] ) {
        self.product = products // Cache
        var vms = [ProductListCellVIewModel]()
        for product in products {
            vms.append( createCellViewModel(product: product) )
        }
        self.cellViewModel = vms
    }
    
    
    func userPressed( at indexPath: IndexPath ){
        let products = self.product[indexPath.row]
            self.selectedProduct = products
    }
}
