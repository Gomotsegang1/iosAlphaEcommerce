//
//  SingleViewController.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 133 on 2023/06/08.
//

import UIKit

extension UIImageView {
    func downloadeds(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloadeds(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

class SingleViewController: UIViewController {
    
    
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var imgItem: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblColor: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblXS: UILabel!
    @IBOutlet weak var lblS: UILabel!
    
    @IBOutlet weak var lblM: UILabel!
    @IBOutlet weak var lblL: UILabel!
    @IBOutlet weak var lblXL: UILabel!

    @IBOutlet weak var lblGender: UILabel!
    
    @IBOutlet weak var cartCount: UIBarButtonItem!
    
    @IBOutlet weak var cart: UIBarButtonItem!

    
    var productName : String!
    var size : String!
    var brand : String!
    var category : String!
//    var description : String!
    var price : Double!
    var colour : String!
    var gender : String!
    var image: UIImage!
    var count : Int! = 0
    
    
    var name : String!
    var imgname : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblCategory.text = category
        lblProductName.text = name
        lblColor.text = colour
        lblPrice.text = String(price) + " ZAR"
        //lblGender.text = gender
        //imgItem.image = imgname
        imgItem.image = UIImage(named: String(imgname))
        
        let iimg = imgname
        imgItem.downloadeds(from: iimg!)
        
        if size == "XS" {
            lblXS.textColor = UIColor(red: 0, green: 226, blue: 157, alpha: 50)
            lblXS.font = UIFont.systemFont(ofSize: 20)
        } else if size == "S"{
            lblS.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 100)
            lblS.font = UIFont.systemFont(ofSize: 22)
        } else if size == "M"{
            lblM.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 100)
            lblM.font = UIFont.systemFont(ofSize: 22)
        } else if size == "L"{
            lblL.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 100)
            lblL.font = UIFont.systemFont(ofSize: 22)
        } else if size == "XL"{
            lblXL.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 100)
            lblXL.font = UIFont.systemFont(ofSize: 22)
        }
        
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
        count += 1
//        lblCount.text = String(count)
        cartCount.title = String(count)
    }
    
}

