//
//  ViewController.swift
//  codepath-tip-calculator
//
//  Created by Lim, Jeremie on 1/5/16.
//  Copyright © 2016 Lim, Jeremie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        // Autofocus keyboard on load
        self.billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Changing Status Bar Color to White
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        
        //LightContent
        return UIStatusBarStyle.LightContent
        
    }

    // Hide Keyboard When Clicking Outside of Form
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    // Calculate Tip
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        // Check if bill total field is not empty
        if billField.text != "" {
    
            // Get percentage amount
            var tipPercentages = [0.18,0.2,0.22]
            let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
            
            let billAmount = Double(billField.text!)
            let tip = billAmount! * tipPercentage
            let total = billAmount! + tip
            
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
        } else {
            // Reset tip and total labels
            tipLabel.text = "$0.00"
            totalLabel.text = "$0.00"
        }
    }
    

}

