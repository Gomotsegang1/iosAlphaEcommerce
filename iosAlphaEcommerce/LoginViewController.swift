//
//  LoginViewController.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 135 on 2023/06/20.
//

import UIKit

class LoginViewController: UIViewController {
	
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		activityIndicator.isHidden.toggle()
    }
    

	@IBAction func loginButton(_ sender: UIButton) {
		
		activityIndicator.isHidden.toggle()
		activityIndicator.startAnimating()
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){ [self] in
			let webService = WebService()
			webService.loginUser(email: emailTextField.text!, password: passwordTextField.text!)
			
			activityIndicator.stopAnimating()
			activityIndicator.isHidden.toggle()
		}
	}
    

}
