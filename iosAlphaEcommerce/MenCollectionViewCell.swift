//
//  MenCollectionViewCell.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 139 on 2023/06/08.
//

import UIKit

class MenCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    
    
    func setup(with product: Products)
    {
        productImageView.image = UIImage(named: product.image)
        lblName.text = product.title
        lblPrice.text = "R " + String(product.price)
    }
}
