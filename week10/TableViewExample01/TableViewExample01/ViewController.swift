//
//  ViewController.swift
//  TableViewExample01
//
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // define an array of values ..which you want to be displayed as Table view
    let courseList = ["Swift", "Python", "CSharp", "Java"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    } // end func

   // returns how many rows in the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return courseList.count
   }
   
    // returns the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let tempCell = tableView.dequeueReusableCell(withIdentifier: "cell")
        tempCell?.textLabel?.text = courseList[indexPath.row]
        return tempCell!
    }

} // end class

