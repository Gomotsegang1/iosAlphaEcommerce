//
//  RegisterViewController.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 135 on 2023/06/20.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
	
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	
	let webService = WebService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		activityIndicator.isHidden.toggle()
        
//        let validateEmail = validateEmail(enteredEmail: emailTextField.text!)
//        let validatePhone = validatePhone(enteredPhone: contactTextField.text!)
//        let validateName = validName(enteredName: firstNameTextField.text!)
//        let validateSurname = validName(enteredName: lastNameTextField.text!)
//        let validateAddress = validAddress(enteredAddress: addressTextField.text!)
//        
//        if(validateName == false)
//        {
//            addAlert(message: "Enter Name", title: "Enter Name")
//        }
//        if(validateSurname == false)
//        {
//            addAlert(message: "Enter Surname", title: "Enter Surname")
//        }
//        if(validateEmail == false)
//        {
//            addAlert(message: "Enter correct email", title: "Invalid email")
//        }
//        if(validatePhone == false)
//        {
//            addAlert(message: "Enter correct number", title: "Invalid number")
//        }
//        if(validateAddress == false)
//        {
//            addAlert(message: "Enter Address", title: "Invalid Address")
//        }
//        else
//        {
//            addAlert(message: "Successfully registered", title: "Success!")
//        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
	@IBAction func registerButton(_ sender: UIButton) {
		
		activityIndicator.isHidden.toggle()
		activityIndicator.startAnimating()
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 4.0){ [self] in
			
			let validateEmail = validateEmail(enteredEmail: emailTextField.text!)
			let validatePhone = validatePhone(enteredPhone: contactTextField.text!)
			let validateName = validName(enteredName: firstNameTextField.text!)
			let validateSurname = validName(enteredName: lastNameTextField.text!)
			let validateAddress = validAddress(enteredAddress: addressTextField.text!)
			
			if(validateName == false)
			{
				addAlert(message: "Enter Name", title: "Enter Name")
			}
			if(validateSurname == false)
			{
				addAlert(message: "Enter Surname", title: "Enter Surname")
			}
			if(validateEmail == false)
			{
				addAlert(message: "Enter correct email", title: "Invalid email")
			}
			if(validatePhone == false)
			{
				addAlert(message: "Enter correct number", title: "Invalid number")
			}
			if(validateAddress == false)
			{
				addAlert(message: "Enter Address", title: "Invalid Address")
			}
			else
			{
				webService.registerUser(firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, email: emailTextField.text!, contact: contactTextField.text!, address: addressTextField.text!, password: passwordTextField.text!, confirmPassword: confirmPasswordTextField.text!)
				addAlert(message: "Successfully registered", title: "Success!")
			}
			activityIndicator.stopAnimating()
			activityIndicator.isHidden.toggle()
		}
	}
    
    func addAlert(message: String, title: String) {
        let alert = UIAlertController(title: title, message: message,preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        self.present(alert, animated: true, completion: nil)
    }
    func validateEmail(enteredEmail:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
    }


    func validatePhone(enteredPhone: String)->Bool {
            let phoneRegex = "\\d{10}"
            let predicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return  predicate.evaluate(with: enteredPhone)
        }

    func validName(enteredName: String) -> Bool {
            let RegEx = "\\w{1,25}"
            let predicate = NSPredicate(format:"SELF MATCHES %@", RegEx)
            return predicate.evaluate(with: enteredName)
        }
    
    func validAddress(enteredAddress: String) -> Bool {
            let RegEx = "\\w{1,255}"
            let predicate = NSPredicate(format:"SELF MATCHES %@", RegEx)
            return predicate.evaluate(with: enteredAddress)
        }
	
}
