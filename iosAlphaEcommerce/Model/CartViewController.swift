//
//  CartViewController.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 117 on 2023/06/21.
//

import UIKit
import CoreData

class CartViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, UITabBarDelegate {
    
    var item = [Products]()
    var cartArray: [[String]] = (CoreData.NSArray() as! [[String]])
    var cart = [NSManagedObject]()
    
    
    
    
    func fetchApiData(completed: @escaping() -> ()){
        let url = URL(string: "https://fakestoreapi.com/products")
        URLSession.shared.dataTask(with: url!) {data, result, error in
            
            if error == nil{
                do{
                    self.item = try JSONDecoder().decode([Products].self, from: data!)
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

    @IBOutlet weak var cartTabItem: UITabBarItem!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //cartTabItem.delegate = self

        // Do any additional setup after loading the view.
        retrieveCoreData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        
        //guard UIApplication.shared.delegate is AppDelegate else {return}
        
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let fetchResult = NSFetchRequest<NSFetchRequestResult>(entityName: "CartOrder")
        
        do{
            let result = try managedContext.fetch(fetchResult)
            
            for data in result as! [NSManagedObject] {
            
                cell.lblCProductName.text = data.value(forKey: "productname") as? String
                cell.lblCProductPrice.text = (data.value(forKey: "productprice") as! String)
//                print(data.value(forKey: "productprice") as! String)
//                print(data.value(forKey: "productquantity") as! String)
//
                
//                print(data.value(forKey: "productname") as! String)
//                print(data.value(forKey: "productprice") as! String)
//                print(data.value(forKey: "productquantity") as! String)
            }
            
        }catch{
            print("failed")
        }
        
        
        

        //cell.lblCProductName.text = cartArray[indexPath.row].first
//        cell.lblCProductPrice.text = "\(item[indexPath.row].price)"
//        cell.lblCProductQuantity.text = "0"
//        cell.cartImage.image = UIImage(named: item[indexPath.row].image)
        
        return cell
    }
    

    
    func retrieveCoreData(){
        
        guard UIApplication.shared.delegate is AppDelegate else {return}
        
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let fetchResult = NSFetchRequest<NSFetchRequestResult>(entityName: "CartOrder")
        
        do{
            let result = try managedContext.fetch(fetchResult)
            
            for data in result as! [NSManagedObject] {
            
                
                //let property = map(data.value(forKey: "productname") as! String)
                
                print(data.value(forKey: "productname") as! String)
                print(data.value(forKey: "productprice") as! String)
                print(data.value(forKey: "productquantity") as! String)
            
                
//                print(data.value(forKey: "productname") as! String)
//                print(data.value(forKey: "productprice") as! String)
//                print(data.value(forKey: "productquantity") as! String)
                
            

            }
            
        }catch{
            print("failed")
        }
    }

}
