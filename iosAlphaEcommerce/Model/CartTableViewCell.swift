//
//  CartTableViewCell.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 117 on 2023/06/22.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCProductName: UILabel!
    @IBOutlet weak var lblCProductPrice: UILabel!
    @IBOutlet weak var lblCProductQuantity: UILabel!
    
    @IBOutlet weak var cartImage: UIImageView!
    
    
    
    var name = ""
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblCProductName.text = name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
