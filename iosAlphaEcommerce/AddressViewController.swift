//
//  AddressViewController.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 133 on 2023/06/21.
//

import UIKit

class AddressViewController: UIViewController {
    
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtNumber: UITextField!
    @IBOutlet weak var txtCode: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var viewaddress: UIView!
    
    
     var Name:String?
     var Surname:String?
     var Email:String?
     var Code:String?
     var City:String?
     var State:String?
     var Number:String?
    var UserId:Int=9
    
    var item: Users!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewLayout()
        
        fetchApiData {[self] in
            fieldInicialize()
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnNext(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "DeliveryViewController") as? DeliveryViewController
                    self.navigationController?.pushViewController(vc!, animated: true)
        print("tloto")

    }
    
    func dataAsign() {
        Name = item.name.firstname.capitalized
        Surname = item.name.lastname.capitalized
        Email = item.email.lowercased()
        City = item.address.city
        Code = item.address.zipcode
        State = item.address.street
        Number = item.phone
    }
    
    
    func fieldInicialize() {
        dataAsign()
        txtName.text = Name! + " " + Surname!
        txtEmail.text = Email
        txtCity.text = City
        txtCode.text = Code
        txtState.text = State
        txtNumber.text = Number
    }
    
    func fetchApiData(completed: @escaping() -> ()){
            let url = URL(string:"https://fakestoreapi.com/users/\(UserId)")
            URLSession.shared.dataTask(with: url!) {data, result, error in

                if error == nil{
                    do{
                        self.item = try JSONDecoder().decode(Users.self, from: data!)
                        print(data!)
                    }
                    catch{
                        print("Error fetching data from API.")
                    }

                    DispatchQueue.main.async {
                        completed()
                    }
                }
            }.resume()
                          }
    
    
    
    func viewLayout(){
        
        addressView.layer.cornerRadius = 35
        let bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0, y: txtName.frame.height - 2, width: txtName.frame.width, height: 2)
            bottomLine.backgroundColor = UIColor.init(red: 157/255, green: 180/255, blue: 192/255, alpha: 1).cgColor
        let bottomLine1 = CALayer()
            bottomLine1.frame = CGRect(x: 0, y: txtEmail.frame.height - 2, width: txtEmail.frame.width, height: 2)
            bottomLine1.backgroundColor = UIColor.init(red: 157/255, green: 180/255, blue: 192/255, alpha: 1).cgColor
        let bottomLine2 = CALayer()
            bottomLine2.frame = CGRect(x: 0, y: txtCity.frame.height - 2, width: txtCity.frame.width, height: 2)
            bottomLine2.backgroundColor = UIColor.init(red: 157/255, green: 180/255, blue: 192/255, alpha: 1).cgColor
        let bottomLine3 = CALayer()
            bottomLine3.frame = CGRect(x: 0, y: txtCode.frame.height - 2, width: txtCode.frame.width, height: 2)
            bottomLine3.backgroundColor = UIColor.init(red: 157/255, green: 180/255, blue: 192/255, alpha: 1).cgColor
        let bottomLine4 = CALayer()
            bottomLine4.frame = CGRect(x: 0, y: txtState.frame.height - 2, width: txtState.frame.width, height: 2)
            bottomLine4.backgroundColor = UIColor.init(red: 157/255, green: 180/255, blue: 192/255, alpha: 1).cgColor
        let bottomLine5 = CALayer()
            bottomLine5.frame = CGRect(x: 0, y: txtNumber.frame.height - 2, width: txtNumber.frame.width, height: 2)
            bottomLine5.backgroundColor = UIColor.init(red: 157/255, green: 180/255, blue: 192/255, alpha: 1).cgColor


        txtName.borderStyle = .none
        txtEmail.borderStyle = .none
        txtCity.borderStyle = .none
        txtCode.borderStyle = .none
        txtState.borderStyle = .none
        txtNumber.borderStyle = .none

                //Add line to the text field

        txtName.layer.addSublayer(bottomLine)
        txtEmail.layer.addSublayer(bottomLine1)
        txtCity.layer.addSublayer(bottomLine2)
        txtCode.layer.addSublayer(bottomLine3)
        txtState.layer.addSublayer(bottomLine4)
        txtNumber.layer.addSublayer(bottomLine5)
        
    }
}
