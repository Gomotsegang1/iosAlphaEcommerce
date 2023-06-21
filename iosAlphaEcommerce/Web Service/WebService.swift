//
//  WebService.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 135 on 2023/06/21.
//

//MARK: This WebService file is for any outgoing and incoming connections to URLs

import Foundation


class WebService{
	private var dataTask: URLSessionDataTask?
	
	func registerUser(firstName: String, lastName: String, email: String, contact: String, address: String, password: String, confirmPassword: String) {
		
		//Temporary endpoint for user registration
		guard let urlString = URL(string: "http://localhost:3001/register") else{
			print("Invalid URL!")
			return
		}
		
		//create user registration data as a dicitonary
		let newUser = ["firstName": firstName, "lastName": lastName, "email": email, "contact": contact, "address": address, "password": password, "confirmPassword": confirmPassword]
		
		
		do{
			//convert newUser to JSON
			let jsonData = try JSONSerialization.data(withJSONObject: newUser, options: [])
			
			//create URL request
			var request = URLRequest(url: urlString)
			request.httpMethod = "POST"
			request.setValue("application/json", forHTTPHeaderField: "Content-Type")
			request.httpBody = jsonData
			
			
			//create URLSession to send the request
			dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
				if let error = error{
					print("Error: \(error.localizedDescription)")
				}
				
				guard data != nil else{
					print("Empty data!")
					return
				}
				
				if let response = response as? HTTPURLResponse{
					
					if response.statusCode == 200{
						print("Registered successfully.")
					}else{
						print("Response error: \(response.statusCode)")
					}
				}
			}
			dataTask?.resume()
			
		}catch{
			print("Error creating JSON data: \(error.localizedDescription)")
		}
	}
	
	
	func loginUser(email: String, password: String){
		//Temporary endpoint for user registration
		guard let urlString = URL(string: "http://localhost:3001/login") else{
			print("Invalid URL!")
			return
		}
		
		//create user registration data as a dicitonary
		let newUser = ["email": email, "password": password]
		
		
		do{
			//convert newUser to JSON
			let jsonData = try JSONSerialization.data(withJSONObject: newUser, options: [])
			
			//create URL request
			var request = URLRequest(url: urlString)
			request.httpMethod = "POST"
			request.setValue("application/json", forHTTPHeaderField: "Content-Type")
			request.httpBody = jsonData
			
			
			//create URLSession to send the request
			dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
				if let error = error{
					print("Error: \(error.localizedDescription)")
				}
				
				guard data != nil else{
					print("Empty data!")
					return
				}
				
				if let response = response as? HTTPURLResponse{
					
					if response.statusCode == 200{
						print("Logged in successfully.")
					}else{
						print("Response error: \(response.statusCode)")
					}
				}
			}
			dataTask?.resume()
			
		}catch{
			print("Error creating JSON data: \(error.localizedDescription)")
		}
	}
	
}
