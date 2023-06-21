//
//  Item.swift
//  ios Clothing App
//
//  Created by DA MAC M1 139 on 2023/06/02.
//

import Foundation
import UIKit


//var counts: [Count] = [
//    Count(counting: 0)
//]

struct Item1{
    let gender: String
    let category: String
    let name: String
    let size: String
    let price: Double
    let colour: String
    let image: UIImage
}

let items1: [Item1] = [
    Item1(gender: "Women", category: "Jackets", name:"Nike Puffer", size: "S", price: 250.99, colour: "Black", image: #imageLiteral(resourceName: "pink jacket")),
    
    Item1(gender: "Women", category: "Pants", name: "blue jean", size: "M", price: 250.99, colour: "Grey", image: #imageLiteral(resourceName: "blueTop")),
    
    Item1(gender: "Women", category: "Shirts", name: "Black top", size: "L", price: 199.99, colour: "Blue", image: #imageLiteral(resourceName: "black tshirt")),
    
    Item1(gender: "Women", category: "Dresses", name: "Corduroy", size: "XL", price: 300.99, colour: "White", image: #imageLiteral(resourceName: "black ripped dress")),
    
    Item1(gender: "Women", category: "Pants", name: "Red pants", size: "S", price: 500.00, colour: "Navy", image: #imageLiteral(resourceName: "tracksuit")),
    
    Item1(gender: "Women", category: "Jackets", name: "Coat", size: "S", price: 730.00, colour: "Black", image: #imageLiteral(resourceName: "blackCoat")),
    
    Item1(gender: "Women", category: "Pants", name: "Jean", size: "M", price: 799.99, colour: "Blue", image: #imageLiteral(resourceName: "blueJeans")),
    
    Item1(gender: "Women", category: "Dresses", name: "Bodycon", size: "L", price: 250.99, colour: "Pink", image: #imageLiteral(resourceName: "pinkbodycom")),
    
    Item1(gender: "Women", category: "Skirts", name: "Mini Skirt", size: "XL", price: 250.99, colour: "Purple", image: #imageLiteral(resourceName: "purpleskirt")),
    
    Item1(gender: "Women", category: "Tops", name: "Strapless", size: "M", price: 250.99, colour: "Black", image: #imageLiteral(resourceName: "blackstriplesstop"))
]

