//
//  ProductListTableView+EXT.swift
//  Peoduct list
//
//  Created by Bedo on 20/01/2023.
//

import UIKit

extension ProductListVC : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productListVIewModel.numberOfCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListTableViewCell") as? ProductListTableViewCell else{
            fatalError("Not found cell identifier")
        }
        let cellVM = productListVIewModel.getCellViewModel(at: indexPath)
        cell.productListCellVIewModel = cellVM
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        self.productListVIewModel.userPressed(at: indexPath)
        performSegue(withIdentifier: "GoProductDetails", sender: self)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productDetailsVC = segue.destination as? ProductDetailsVC,
            let product = productListVIewModel.selectedProduct {
            productDetailsVC.productDescription = "Description: \(product.description ?? "")"
            productDetailsVC.productCategory = product.category
            productDetailsVC.productName = product.title
            productDetailsVC.productImages = product.images
            productDetailsVC.productPrice = "\(product.price ?? 0)"
        
        }
    }
}
