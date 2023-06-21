//
//  Item.swift
//  ios Clothing App
//
//  Created by DA MAC M1 139 on 2023/06/02.
//

import Foundation
import UIKit

struct Count{
    var counting : Int
}
class coun {
    var cc : Int = 3
}

//var counts: [Count] = [
//    Count(counting: 0)
//]

struct Item{
    let gender: String
    let category: String
    let name: String
    let size: String
    let price: Double
    let colour: String
    let image: UIImage
}

let items: [Item] = [
    Item(gender: "Mens", category: "Jackets", name:"Blazer", size: "S", price: 250.99, colour: "Black", image: #imageLiteral(resourceName: "black jacket")),
    
    Item(gender: "Mens", category: "Pants", name: "Jogger", size: "M", price: 250.99, colour: "Grey", image: #imageLiteral(resourceName: "grey joggers")),
    
    Item(gender: "Mens", category: "Shirts", name: "Collar Shirt", size: "L", price: 199.99, colour: "Blue", image: #imageLiteral(resourceName: "blueShirt")),
    
    Item(gender: "Mens", category: "Shorts", name: "Corduroy", size: "XL", price: 300.99, colour: "White", image: #imageLiteral(resourceName: "white shorts")),
    
    Item(gender: "Mens", category: "Tshirts", name: "Round Neck", size: "S", price: 500.00, colour: "Navy", image: #imageLiteral(resourceName: "navyshirt")),
    
]
