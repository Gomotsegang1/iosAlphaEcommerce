//
//  womenViewController.swift
//  iosAlphaEcommerce
//
//  Created by DA MAC M1 163 on 2023/06/08.
//

import UIKit

class womenViewController: UIViewController {
var count = 0
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var item = [Products]()
    
    var searchProduct = [Products]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        fetchApiData { [self] in
            print("Success: Women Controller")
            searchProduct = item
            collectionView.reloadData()
        }
    }
    
    func fetchApiData(completed: @escaping() -> ()){
        let url = URL(string: "https://fakestoreapi.com/products/category/women's%20clothing")
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
    @IBAction func btnAll(_ sender: UIButton) {
        searchProduct = []
        for word in items1{
            if word.category == "Pants" || word.category == "Jackets" || word.category == "" || word.category == "Dresses" || word.category == "Shirts"
            {
//                searchProduct.append(word)

            }
        }
        self.collectionView.reloadData()
    }
   
    @IBAction func btnJackets(_ sender: UIButton) {
        searchProduct = []
        for word in items1{
            if word.category == "Jackets"
            {
//                searchProduct.append(word)

            }
        }
        self.collectionView.reloadData()

    }
    @IBAction func btnShirts(_ sender: UIButton) {
        searchProduct = []
        for word in items1{
            if word.category == "Shirts"
            {
//                searchProduct.append(word)

            }
        }
        self.collectionView.reloadData()

    }
    @IBAction func btnDresses(_ sender: UIButton) {
        searchProduct = []
        for word in items1{
            if word.category == "Dresses"
            {
//                searchProduct.append(word)

            }
        }
        self.collectionView.reloadData()

    }
    @IBAction func btnPants(_ sender: UIButton) {
        searchProduct = []
        for word in items1{
            if word.category == "Pants"
            {
//                searchProduct.append(word)

            }
        }
        self.collectionView.reloadData()
    }
    
}
extension womenViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WomenCollectionViewCell", for: indexPath) as! womenCollectionViewCell
        cell.setup(with: item[indexPath.row])
        
        
        let imageURL = searchProduct[indexPath.row].image as? String
        
        if let url = URL(string: imageURL!) {
            // Create a URLSessionDataTask to download the image data
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    // Convert the downloaded data into a UIImage
                    let image = UIImage(data: data)
                    
                    DispatchQueue.main.async {
                        // Update the UIImageView in the collection view cell with the downloaded image
                        cell.productImageView.image = image
                        cell.setNeedsLayout() // Ensure the image view is updated
                    }
                }
            }.resume()
            
            cell.namelbl.text = searchProduct[indexPath.row].title
            cell.priceLbl.text = "R " + "\(searchProduct[indexPath.row].price)"
            cell.productImageView.image = UIImage(named: searchProduct[indexPath.row].image)
            
            cell.reloadInputViews()
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 10
        }
        return cell
    }
}
    extension womenViewController: UICollectionViewDelegateFlowLayout{
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 190, height: 260)
        }
    }
    extension womenViewController: UISearchBarDelegate{
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            searchProduct = []
            if searchText == ""
            {
                    searchProduct = item
            }
            for word in item{
                if word.title.lowercased().contains(searchText.lowercased())
                {
                    searchProduct.append(word)
                    //self.collectionView.reloadData()
                }
            }
            self.collectionView.reloadData()
            //self.collectionView.reloadSections(IndexSet(integer: 0))
        }
    }
    
    extension womenViewController: UICollectionViewDelegate{
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            let vc = storyboard?.instantiateViewController(identifier: "SingleViewController") as? SingleViewController
            //    let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
            //        let defaults = UserDefaults.standard
            //
            //        defaults.set(count, forKey: "Countt")
            
            vc?.name = searchProduct[indexPath.row].title
            vc?.category = searchProduct[indexPath.row].category
            //        vc?.colour = item[indexPath.row].colour
            vc?.price = searchProduct[indexPath.row].price
            //        vc?.gender = item[indexPath.row].gender
            vc?.imgname = searchProduct[indexPath.row].image
            //        vc?.size = item[indexPath.row].size
            //        vc?.count = count
            self.navigationController?.pushViewController(vc!, animated: true)
            print(item[indexPath.row].category)
        }
    }
    
    
    //MARK: Extension from StackOverFlow
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
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
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
