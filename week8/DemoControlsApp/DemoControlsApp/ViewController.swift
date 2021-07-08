//
//  ViewController.swift
//  DemoControlsApp
//
//  Created by Yu-Hsuan Huang on 2021/7/5.
//  Copyright © 2021 Georgian College. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    /* slider */
    @IBAction func slider(_ sender: UISlider) {
        //need to set up attribute max, min, value...
        //get value from slider
        let value = sender.value
    }
    
    /* switch */
    @IBAction func `switch`(_ sender: UISwitch) {
        
        if sender.isOn {
            //TODO switch is on
        } else {
            //TODO switch is off
        }
    }
    
    /* indicator */
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    //when loading you can use this code to start
//    activityIndicator.startAnimating()
    //when finished you can use this code to stop
//    activityIndicator.stopAnimating()
    
    
    
    /* stepper */
    @IBAction func stepper(_ sender: UIStepper) {
        //need to set up attribute max, min, value...
        // Display value in label or textfield
        let value = sender.value.description
    }
    
    /* Date picker */
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //TODO dateFormatter func
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        //display date in label or others
//        let date = dateFormatter.string(from: sender.date)
        view.endEditing(true)
    }
    
    /* UI picker */
    @IBOutlet weak var picker: UIPickerView!
    
    
    
}

