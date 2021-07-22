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

    // returns how many rows in the table
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return productList.count
    } // end func tableview
     
    // returns the cell
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
     {

        let tempCell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        tempCell.labelDevice.text = productList[indexPath.row]
        tempCell.labelPrice.text = priceList[indexPath.row]
        tempCell.imageDevice.image = UIImage(named: images[indexPath.row] + ".jpg" )
        
        return tempCell
    } // end func tableView

} // end class


