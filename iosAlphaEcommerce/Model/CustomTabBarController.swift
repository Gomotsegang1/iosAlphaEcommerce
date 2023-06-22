//
//  CustomTabBarController.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 117 on 2023/06/21.
//

import UIKit

class CustomTabBarController: UITabBarController {
    @IBInspectable var initialIndex: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //cartTabItem.delegate = self

        selectedIndex = initialIndex
    }
}
