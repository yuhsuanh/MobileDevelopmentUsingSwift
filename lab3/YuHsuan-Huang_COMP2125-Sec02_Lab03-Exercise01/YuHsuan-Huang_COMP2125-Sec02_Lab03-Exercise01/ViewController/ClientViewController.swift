//
//  ClientViewController.swift
//  YuHsuan-Huang_COMP2125-Sec02_Lab03-Exercise01
//
//  Created by Yu-Hsuan Huang on 2021/7/13.
//  Copyright © 2021 Georgian College. All rights reserved.
//

import UIKit

class ClientViewController: UIViewController {
    
    
    var user: String = ""
    
    @IBOutlet weak var projectName: UITextField!
    
    @IBOutlet weak var projectDuration: UITextField!
    
    @IBOutlet weak var projectLocation: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submit(_ sender: UIButton) {
        let result:String = "User name: " + user + "\n" + "Project name: " + projectName.text! + "\n" + "Project duration: " + projectDuration.text! + "\n" + "Project Loccation: " + projectLocation.text!
        textView.text = result
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
