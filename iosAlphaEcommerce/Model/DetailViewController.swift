//
//  DetailViewController.swift
//  CollectionViews
//
//  Created by DA MAC M1 133 on 2023/06/06.
//  Copyright © 2023 Macco. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var counter: UIBarButtonItem!
    @IBOutlet weak var lbltitle: UILabel!
    
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var imgDetail: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    
    @IBOutlet weak var lblClolour: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    var productName : String!
    var size : String!
    var brand : String!
    var category : String!
//    var description : String!
    var price : Double!
    var colour : String!
    var gender : String!
    var image: UIImage!
    var count : Int!
    
    
    var name : String!
    var imgname : UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        count = 0
        lbltitle.text = name
        lblProductName.text = name
        lblClolour.text = colour
        lblPrice.text = String(price) + " ZAR"
        imgDetail.image = imgname
        
        print(name!)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnAddToCart(_ sender: Any) {
        
    
        count+=1
        lblCount.text = String(count)
        counter.title = String(count)
        
    }
}
