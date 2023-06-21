//
//  ConfirmViewController.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 133 on 2023/06/21.
//

import UIKit

class ConfirmViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addAlert(message: "Hello, TLOTLO. Thank you for shopping with CLOTHING AVENUE. Your payment for R5 000.00 has been verified", title: "Successful!!!")
    }
    
    
    
    
    @IBAction func btnConfirm(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "CategoryViewController") as? CategoryViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func addAlert(message: String, title: String) {
        let alert = UIAlertController(title: title, message: message,preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: { _ in
                //Cancel Action
            }))
            self.present(alert, animated: true, completion: nil )
        }

}
