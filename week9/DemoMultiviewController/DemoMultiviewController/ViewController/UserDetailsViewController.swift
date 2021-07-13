//
//  UserDetailsViewController.swift
//  DemoMultiviewController
//
//  Created by Yu-Hsuan Huang on 2021/7/12.
//  Copyright © 2021 Georgian College. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    @IBOutlet weak var labelFirstName: UILabel!
    
    @IBOutlet weak var textLastName: UITextField!
    //save value from login page
    var firstName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelFirstName.text = firstName
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
