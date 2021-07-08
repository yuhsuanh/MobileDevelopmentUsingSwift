//
//  ViewController.swift
//  Greeting
//
//  Created by Yu-Hsuan Huang on 2021/7/5.
//  Copyright © 2021 Georgian College. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //outlets
    
    var n1: String?
    var n2: String!
    
    @IBOutlet weak var textFirstName: UITextField!
    
    @IBOutlet weak var labelOutput: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading  the view.
    }
    
    
    @IBAction func btnSubmit(_ sender: UIButton) {
        
        labelOutput.text = "Welcome " + textFirstName.text! + " !"
        
    }
    

}

