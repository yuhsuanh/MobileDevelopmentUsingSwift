//
//  ViewController.swift
//  TableViewExample02

//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // define an array of values ..which you want to be displayed
    let productList = ["iPhone", "Galaxy", "Pixel3", "Vivo"]
    let priceList = ["1250.00", "1100.00", "899.00", "750.00"]
    
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
         let tempCell = tableView.dequeueReusableCell(withIdentifier: "cell")
         tempCell?.textLabel?.text = productList[indexPath.row]
        tempCell?.detailTextLabel?.text = priceList[indexPath.row]
         return tempCell!
    } // end func tableView

} // end class

