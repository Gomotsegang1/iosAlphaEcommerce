//
//  womenCollectionViewCell2.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 163 on 2023/06/08.
//

import UIKit

class womenCollectionViewCell: UICollectionViewCell {
    
        @IBOutlet weak var productImageView: UIImageView!
        
        @IBOutlet weak var priceLbl: UILabel!
        @IBOutlet weak var namelbl: UILabel!
        
        func setup(with product: Products)
        {
            namelbl.text = product.title
            priceLbl.text = "R " + String(product.price)
            productImageView.image = UIImage(named: product.image)
        }
    

    
}
