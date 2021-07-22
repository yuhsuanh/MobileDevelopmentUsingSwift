//
//  ViewController.swift
//  TableViewCustomCellExample01
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // define an array of values ..which you want to be displayed
    let productList = ["iPhone", "Galaxy", "Pixel3", "Vivo"]
    let priceList = ["1250.00", "1100.00", "899.00", "750.00"]
    let images = ["iPhone", "Samsung", "Pixel", "Vivo"]
    // outlets
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // return how many rows in the table
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return productList.count
    } // end func tableview
     // return the cell
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
     {

        let tempCell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        tempCell.labelDevice.text = productList[indexPath.row]
        tempCell.labelPrice.text = priceList[indexPath.row]
        tempCell.imageDevice.image = UIImage(named: images[indexPath.row] + ".jpg" )
        
        return tempCell
    } // end func tableView

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC:ProductDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController") as! ProductDetailViewController
       // assign the values to the local variable declared in ProductDetailViewController Class
        detailVC.productName = productList[indexPath.row]
        detailVC.productPrice = priceList[indexPath.row]
        detailVC.productImage = UIImage(named: images[indexPath.row] + ".jpg" )!
        // make it navigate to ProductDetailViewController
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
} // end class


