//
//  ProductListTableViewCell.swift
//  Peoduct list
//
//  Created by Bedo on 20/01/2023.
//

import UIKit

class ProductListTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var productListCellVIewModel:ProductListCellVIewModel?{
        didSet{
            productName.text = productListCellVIewModel?.title
            if let url = productListCellVIewModel?.thumbnail {
            productImage.loadImageUsingCacheWithURLString(url, placeHolder: UIImage(named: "no_image_placeholder"))
            }
        }
    }
}
