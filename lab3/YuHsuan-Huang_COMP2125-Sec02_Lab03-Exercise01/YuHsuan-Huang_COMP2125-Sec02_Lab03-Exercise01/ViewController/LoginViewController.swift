//
//  LoginViewController.swift
//  YuHsuan-Huang_COMP2125-Sec02_Lab03-Exercise01
//
//  Created by Yu-Hsuan Huang on 2021/7/13.
//  Copyright © 2021 Georgian College. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var passwd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let user = userName.text!
        let password = passwd.text!
        
        //TODO login authentication
        
        // Get the new view controller using segue.destination.
        let clientViewController = segue.destination as? ClientViewController
        
        // Pass the selected object to the new view controller.
        clientViewController?.user = user
    }
    

}
