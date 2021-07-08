//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Yu-Hsuan Huang on 2021/7/5.
//  Copyright © 2021 Georgian College. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //outlets
    
    @IBOutlet weak var textNum1: UITextField!
    
    @IBOutlet weak var textNum2: UITextField!
    
    @IBOutlet weak var labelOutput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnAdd(_ sender: UIButton) {
        let result = Int(textNum1.text!)! + Int(textNum2.text!)!
        labelOutput.text = String(result)
    }
    
    @IBAction func btnSub(_ sender: UIButton) {
        let result = Int(textNum1.text!)! - Int(textNum2.text!)!
        labelOutput.text = String(result)
    }
    
    @IBAction func btnMul(_ sender: UIButton) {
        let result = Double(textNum1.text!)! * Double(textNum2.text!)!
        labelOutput.text = String(result)
    }
    
    @IBAction func btnDiv(_ sender: UIButton) {
        let result = Double(textNum1.text!)! / Double(textNum2.text!)!
        labelOutput.text = String(result)
    }
    
}

