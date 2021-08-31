//
//  ApplianceViewController.swift
//  YuHsuan-Huang_COMP2125-02_Final-Term
//
//  Created by Yu-Hsuan Huang on 2021/8/15.
//

import UIKit

class ApplianceViewController: UIViewController {
    
    @IBOutlet weak var textFieldApplianceId: UITextField!
    
    @IBOutlet weak var textFieldName: UITextField!
    
    @IBOutlet weak var textFieldPrice: UITextField!
    
    @IBOutlet weak var textFieldQuantity: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let randomApplianceId = Int.random(in: 100..<1000)
        textFieldApplianceId.text = String(randomApplianceId)
        
    }
    
    /*
     Pass the appliance data to UserViewController
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is UserViewController {
            let vc = segue.destination as? UserViewController
            
            let appliance = Appliance()
            appliance.applianceId = Int(textFieldApplianceId.text!)!
            appliance.name = textFieldName.text!
            appliance.price = Float(textFieldPrice.text!)!
            appliance.quantity = Int(textFieldQuantity.text!)!
            
            vc?.appliance = appliance
        }
    }
    
    
    /*
     To make sure all of the textfields have value
        ps. I don't need to make sure the price and quantity is number because I the default keyboard is number when users use by iphone
     */
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        //make sure all fields are entered
        if  textFieldApplianceId.text!.isEmpty
            || textFieldName.text!.isEmpty
            || textFieldPrice.text!.isEmpty
            || textFieldQuantity.text!.isEmpty {
            
            // show alert: enter all fields
            let alert = UIAlertController(title: "ERROR", message: "You should enter all values!!!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {(UIAlertAction) in
                _ = self.navigationController?.popViewController(animated: false)
            }))
            self.present(alert, animated: true, completion: nil)

            return false
        } else if Int(textFieldQuantity.text!)! > 3 || Int(textFieldQuantity.text!)! < 1 {
            //make sure the quantity is correct
            
            // show alert: quantity error
            let alert = UIAlertController(title: "ERROR", message: "Your quantity must between 1 to 3", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {(UIAlertAction) in
                _ = self.navigationController?.popViewController(animated: false)
            }))
            self.present(alert, animated: true, completion: nil)
            
            return false
        } else if Float(textFieldPrice.text!)! < 0 {
            
            // show alert: price must greater than 0
            let alert = UIAlertController(title: "ERROR", message: "Your price must greater than ZERO", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {(UIAlertAction) in
                _ = self.navigationController?.popViewController(animated: false)
            }))
            self.present(alert, animated: true, completion: nil)
            
            return false
        }
        
        return true
    }
}
