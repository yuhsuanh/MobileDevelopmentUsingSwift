//
//  LoginDetailsViewController.swift
//  DemoMultiviewController
//
//  Created by Yu-Hsuan Huang on 2021/7/12.
//  Copyright © 2021 Georgian College. All rights reserved.
//

import UIKit

class LoginDetailsViewController: UIViewController {

    @IBOutlet weak var textFirstName: UITextField!
    
    var firstName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        firstName = textFirstName.text!
        
        // Get the new view controller using segue.destination.
        let userDetailsViewController = segue.destination as? UserDetailsViewController
     
     
        // Pass the selected object to the new view controller.
        userDetailsViewController?.firstName = firstName
        
        
    }
    

}
