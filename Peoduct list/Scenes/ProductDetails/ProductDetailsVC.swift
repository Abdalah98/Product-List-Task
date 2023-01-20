//
//  ProductDetailsVC.swift
//  Peoduct list
//
//  Created by Bedo on 20/01/2023.
//

import UIKit

class ProductDetailsVC: UIViewController {
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productCategoryLabel: UILabel!
    @IBOutlet weak var productPricsLabel: UILabel!
    @IBOutlet weak var collectoinView: UICollectionView!
    var product: Product!

    var productDescription : String?
    var productCategory : String?
    var productName : String?
    var productPrice : String?
    var  productImages : [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
        fetchData()
    }
    
    @IBAction func favAction(_ sender: UIButton) {
        if sender.currentImage == UIImage(systemName: "heart"){
                sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            }else{
                sender.setImage(UIImage(systemName: "heart"), for: .normal)
            }
    }
    
    func fetchData(){
        productNameLabel.text = productName
        productDescriptionLabel.text = productDescription
        productCategoryLabel.text = productCategory
        productPricsLabel.text = productPrice
        collectoinView.reloadData()
    }
}
