//
//  UserViewController.swift
//  YuHsuan-Huang_COMP2125-02_Final-Term
//
//  Created by Yu-Hsuan Huang on 2021/8/15.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var textFieldUserName: UITextField!
    
    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldAddress: UITextField!
    
    @IBOutlet weak var textViewApplianceDetail: UITextView!
    
    
    
    var appliance: Appliance?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let subtotal = appliance!.price * Float(appliance!.quantity)
        
        let applianceDetail = "Appliance Detail: \n" +
        "Appliance name: \(appliance!.name)\n" +
        "Quantity: \(appliance!.quantity)\n" +
        String(format: "Price: %.2f\n", appliance!.price) +
        String(format: "Sub-Total: %.2f", subtotal)
        
        textViewApplianceDetail.text = applianceDetail
    }
    
    /*
     Pass the appliance data and user data to OrderViewController
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is OrderViewController {
            let vc = segue.destination as? OrderViewController
            let user = User()
            user.name = textFieldUserName.text!
            user.email = textFieldEmail.text!
            user.address = textFieldAddress.text!
            
            vc?.user = user
            vc?.appliance = self.appliance
        }

    }

    /*
     Make sure all of the fields are entered and correct
     */
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        //make sure all fields are entered
        if  textFieldUserName.text!.isEmpty
            || textFieldEmail.text!.isEmpty
            || textFieldAddress.text!.isEmpty {
            
            // show alert: enter all fields
            let alert = UIAlertController(title: "ERROR", message: "You should enter all values!!!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {(UIAlertAction) in
                _ = self.navigationController?.popViewController(animated: false)
            }))
            self.present(alert, animated: true, completion: nil)
            
            return false
        }
        
        return true
    }
}
