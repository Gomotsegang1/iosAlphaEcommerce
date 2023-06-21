//
//  DeliveryViewController.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 133 on 2023/06/21.
//

import UIKit

class DeliveryViewController: UIViewController {
    
    @IBOutlet weak var viewExpress: UIView!
    @IBOutlet weak var viewStandard: UIView!
    @IBOutlet weak var viewFree: UIView!
    @IBOutlet weak var deliveryView: UIView!
    
    var count : Int = 0
    
    var GiveAwayDelivery : Double = 1400
    var freeDeliveryAmount : Double = 0
    var standardDeliveryAmount : Double = 75
    var expressDeliveryAmount : Double = 200
    var totalPurchaseCosts : Double = 300
    
    var deliveryAmount : Double = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        totalDeliveryAmount()
        
        deliveryView.layer.cornerRadius = 35
        viewFree.layer.cornerRadius = 5
        viewStandard.layer.cornerRadius = 5
        viewExpress.layer.cornerRadius = 5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        totalDeliveryAmount()
        print(deliveryAmount)
    }
    
    func totalDeliveryAmount() {
        if (totalPurchaseCosts >= GiveAwayDelivery)  {
            deliveryAmount = freeDeliveryAmount
            addAlert(message: "You qualify for free Express Delivery, Click Next to continue", title: "Free Delivery")
        }
        else{
            deliveryOptions()
        }
    }
    
    func deliveryOptions(){
        
            
            let tap_free = UITapGestureRecognizer(target: self, action: #selector(DeliveryViewController.tapFunctionFree))
                    viewFree.isUserInteractionEnabled = true
                    viewFree.addGestureRecognizer(tap_free)
            
            let tap_standard = UITapGestureRecognizer(target: self, action: #selector(DeliveryViewController.tapFunctionStandard))
                    viewStandard.isUserInteractionEnabled = true
                    viewStandard.addGestureRecognizer(tap_standard)
            
            let tap_express = UITapGestureRecognizer(target: self, action: #selector(DeliveryViewController.tapFunctionExpress))
                    viewExpress.isUserInteractionEnabled = true
                    viewExpress.addGestureRecognizer(tap_express)
         
    }
    
    

  
    @IBAction func btnNext(_ sender: Any) {
        
        if (count == 0 && deliveryAmount > 1400) {
            addAlert(message: "Please select one of the delivery options", title: "Select")
            
        }
//        else if (count == 0 && deliveryAmount < 1400) {
//            addAlert(message: "Please select one of the delivery options", title: "Select")
//        }
        else {
            let vc = storyboard?.instantiateViewController(identifier: "PaymentViewController") as? PaymentViewController
            self.navigationController?.pushViewController(vc!, animated: true)
//            deliveryOptions()
            print(deliveryAmount)
          
        }
    }
    
//   ***********       Alert function       ****************************
    
    func addAlert(message: String, title: String) {
        let alert = UIAlertController(title: title, message: message,preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: { _ in
                //Cancel Action
            }))
            self.present(alert, animated: true, completion: nil )
        }
    

    
//   ***********       Tap functions        ****************************
    
    @IBAction func tapFunctionFree(sender: UITapGestureRecognizer) {
//            print("tap working")
            count = 1
            if count==1 {
                
                viewFree.backgroundColor = .systemGray3
                viewStandard.backgroundColor = .systemGray5
                viewExpress.backgroundColor = .systemGray5
                deliveryAmount = freeDeliveryAmount
                print(deliveryAmount)
            }
            else {
                viewFree.backgroundColor = .systemGray5
            }
        }
    
    @IBAction func tapFunctionStandard(sender: UITapGestureRecognizer) {
//            print("tap working")
            count = 2
            if count==2 {
                viewFree.backgroundColor = .systemGray5
                viewStandard.backgroundColor = .systemGray3
                viewExpress.backgroundColor = .systemGray5
                deliveryAmount = standardDeliveryAmount
                print(deliveryAmount)
            }
            else {
                viewStandard.backgroundColor = .systemGray5
            }
        }
    
    @IBAction func tapFunctionExpress(sender: UITapGestureRecognizer) {
//            print("tap working")
            count = 3
            if count==3 {
                viewFree.backgroundColor = .systemGray5
                viewStandard.backgroundColor = .systemGray5
                viewExpress.backgroundColor = .systemGray3
                deliveryAmount = expressDeliveryAmount
                print(deliveryAmount)
            }
            else {
                viewExpress.backgroundColor = .systemGray5
            }
        }
    


}
