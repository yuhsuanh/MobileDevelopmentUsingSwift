//
//  TaxCalculatorViewController.swift
//  YuHsuan-Huang_COMP2125-Sec02_Lab03-Exercise02
//
//  Created by Yu-Hsuan Huang on 2021/7/13.
//  Copyright © 2021 Georgian College. All rights reserved.
//

import UIKit

class TaxCalculatorViewController: UIViewController {
    
    @IBOutlet weak var billAmount: UITextField!
    
    @IBOutlet weak var taxPercentageLabelTop: UILabel!
    
    @IBOutlet weak var taxPercentageLabel: UILabel!
    
    @IBOutlet weak var defaultTipFee: UILabel!
    
    @IBOutlet weak var defaultTotalFee: UILabel!
    
    @IBOutlet weak var customTipFee: UILabel!
    
    @IBOutlet weak var customTotalFee: UILabel!
    
    @IBOutlet weak var sliderBar: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func enterBillAmount(_ sender: UITextField) {
        //get bill
        let bill = Double(billAmount.text!) ?? 0.0
        
        //set default tip fee and total fee (15%)
        defaultTipFee.text = String(format: "$%.2f", (bill * 0.15))
        defaultTotalFee.text = String(format: "$%.2f", (bill * 1.15))
        
        //get slider value
        let percentage = Double(sliderBar.value.rounded()) / 100
        
        customTipFee.text = String(format: "$%.2f", (bill * Double(percentage)))
        customTotalFee.text = String(format: "$%.2f", (bill * Double(percentage+1)))

    }
    
    @IBAction func sliderBarChange(_ sender: UISlider) {
        //get bill
        let bill = Double(billAmount.text!) ?? 0.0
        
        
        //get slider value
        let intPercentage = Int(sliderBar.value.rounded())
        
        //change displayed label
        taxPercentageLabelTop.text = String(format: "Custom Tip Percentage: %d", intPercentage)
        taxPercentageLabel.text = String(format: "%d%%", intPercentage)
        
        if bill == 0.0 {
            defaultTipFee.text = "$0.0"
            defaultTotalFee.text = "$0.0"
            customTipFee.text = "$0.0"
            customTotalFee.text = "$0.0"
            return
        }
        
        
        //change custom tip fee and coustom total fee
        let percentage = Double(intPercentage) / 100
        customTipFee.text = String(format: "$%.2f", (bill * Double(percentage)))
        customTotalFee.text = String(format: "$%.2f", (bill * Double(percentage+1)))
    }
    
    
}
