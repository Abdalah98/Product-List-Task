//
//  ProductDetailsCollectionView+EXT.swift
//  Peoduct list
//
//  Created by Bedo on 21/01/2023.
//

import UIKit

extension ProductDetailsVC : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
     func configureCollection(){
        collectoinView.delegate = self
        collectoinView.dataSource = self
        let nib = UINib(nibName:"ProductDetailsCollectionViewCell", bundle: nil)
        collectoinView.register(nib, forCellWithReuseIdentifier: "ProductDetailsCollectionViewCell")
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productImages?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailsCollectionViewCell" , for: indexPath) as? ProductDetailsCollectionViewCell
        else {
            fatalError("Cell not exists in storyboard")
        }
        let productImage = productImages?[indexPath.item]
        if let url = productImage {
            cell.imageDetails.loadImageUsingCacheWithURLString(url, placeHolder: UIImage(named: "no_image_placeholder"))
        }
     
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300  , height:240)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 16 , bottom: 5, right: 16)
    }
    
    
}
