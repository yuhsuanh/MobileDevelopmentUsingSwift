//
//  OrderViewController.swift
//  YuHsuan-Huang_COMP2125-02_Final-Term
//
//  Created by Yu-Hsuan Huang on 2021/8/15.
//

import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet weak var textFieldOrderId: UITextField!
    
    @IBOutlet weak var textFieldUserName: UITextField!
    
    @IBOutlet weak var textFieldTotal: UITextField!
    
    @IBOutlet weak var textViewDetail: UITextView!
    
    
    var appliance: Appliance?
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let randomOrderId = Int.random(in: 10..<100)
        textFieldOrderId.text = String(randomOrderId)
        
        textFieldUserName.text = user!.name
        
        let total = appliance!.price * Float(appliance!.quantity) * 1.13
        textFieldTotal.text = String(format: "%.2f", total)
        
        let detail =
            "User Name: \(user!.name)\n" +
            "Email: \(user!.email)\n" +
            "Address: \(user!.address)\n" +
            "===============================\n" +
            "Appliance Detail: \n" +
            "Appliance name: \(appliance!.name)\n" +
            "Quantity: \(appliance!.quantity)\n" +
            String(format: "Price: %.2f\n", appliance!.price) +
            String(format: "Total(included GST): %.2f", total)
        textViewDetail.text = detail
    }
    

    @IBAction func placeOrder(_ sender: Any) {
        let detail = textViewDetail.text!
        textViewDetail.text = "Thanks for your placing order!!!\n\n" + detail
    }
}
