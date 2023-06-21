//
//  PaymentViewController.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 133 on 2023/06/21.
//

import UIKit

class PaymentViewController: UIViewController {
    
    @IBOutlet weak var paymentV: UIView!
    @IBOutlet weak var txtCVV: UITextField!
    @IBOutlet weak var txtExpDate: UITextField!
    @IBOutlet weak var txtCardHolderName: UITextField!
    @IBOutlet weak var txtCardNumber: UITextField!
    
    var CVV : Int!
    var ExpDate : String!
    var CardHolderName : String!
    var CardNumber : String!
    
    var item: Users!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewLayout()
        fieldInicialize()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnPay(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "ConfirmViewController") as? ConfirmViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    func dataAsign() {
        CardHolderName = "Tlotlo Seleke"
        CardNumber = "3453 3536 5685 3452"
        ExpDate = "0625"
        CVV = 422
    }
    
    
    func fieldInicialize() {
        dataAsign()
        txtCardHolderName.text = CardHolderName
        txtCardNumber.text = CardNumber
        txtExpDate.text = String(ExpDate)
        txtCVV.text = String(CVV)
    }
    
    
    

    func viewLayout(){
        
        paymentV.layer.cornerRadius = 35
        
        let bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0, y: txtCardNumber.frame.height - 2, width: txtCardNumber.frame.width, height: 2)
            bottomLine.backgroundColor = UIColor.init(red: 157/255, green: 180/255, blue: 192/255, alpha: 1).cgColor
        let bottomLine1 = CALayer()
            bottomLine1.frame = CGRect(x: 0, y: txtCardHolderName.frame.height - 2, width: txtCardHolderName.frame.width, height: 2)
            bottomLine1.backgroundColor = UIColor.init(red: 157/255, green: 180/255, blue: 192/255, alpha: 1).cgColor
        let bottomLine2 = CALayer()
            bottomLine2.frame = CGRect(x: 0, y: txtExpDate.frame.height - 2, width: txtExpDate.frame.width, height: 2)
            bottomLine2.backgroundColor = UIColor.init(red: 157/255, green: 180/255, blue: 192/255, alpha: 1).cgColor
        let bottomLine3 = CALayer()
            bottomLine3.frame = CGRect(x: 0, y: txtCVV.frame.height - 2, width: txtCVV.frame.width, height: 2)
            bottomLine3.backgroundColor = UIColor.init(red: 157/255, green: 180/255, blue: 192/255, alpha: 1).cgColor
                
                //remove border on textField
        
        txtCardNumber.borderStyle = .none
        txtCardHolderName.borderStyle = .none
        txtExpDate.borderStyle = .none
        txtCVV.borderStyle = .none
                
                //Add line to the text field
                
        txtCardNumber.layer.addSublayer(bottomLine)
        txtCardHolderName.layer.addSublayer(bottomLine1)
        txtExpDate.layer.addSublayer(bottomLine2)
        txtCVV.layer.addSublayer(bottomLine3)
        
        
        
    }

}
