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
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var amountsView: UIView!
    @IBOutlet weak var percentView: UIView!
    
    @IBAction func percentButton(sender: AnyObject) {
        
        view.endEditing(true)
        
        UIView.animateWithDuration(0.3, animations: {
            self.percentView.frame = CGRectMake(0, 0, self.percentView.frame.size.height, self.percentView.frame.size.height)
        })
    }
    
    func initTipLabels() {
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Position Bill Field at the center
        let xBillFieldPos = billField.frame.origin.x
        let billFieldHeight = billField.frame.size.height
        let billFieldWidth = billField.frame.size.width
        
        billField.frame = CGRectMake(xBillFieldPos, 230, billFieldWidth, billFieldHeight)
        
        initTipLabels()
        
        // Autofocus Keyboard on Load
        self.billField.becomeFirstResponder()
        
        // Hide amounts view
        self.amountsView.alpha = 0
        
    
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
        let bounds = UIScreen.mainScreen().bounds
        let boundsHeight = bounds.size.height
        
        // Position Bill Field at the center
        let xBillFieldPos = billField.frame.origin.x
        let billFieldHeight = billField.frame.size.height
        let billFieldWidth = billField.frame.size.width
        
        // Get percentage amount
        var tipPercentages = [0.18,0.2,0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        percentLabel.text = tipControl.titleForSegmentAtIndex(tipControl.selectedSegmentIndex)
        
        
        // Check if bill total field is not empty
        if billField.text != "" {
            self.billField.becomeFirstResponder()
            
            // Animate Tip Total Fields
            UIView.animateWithDuration(0.3, animations: {
                self.amountsView.alpha = 1
                
                self.billField.frame = CGRectMake(xBillFieldPos, CGFloat(130), billFieldWidth, billFieldHeight)
                
                self.percentView.frame = CGRectMake(0, boundsHeight, self.percentView.frame.size.height, self.percentView.frame.size.height)
            })
            
            
            let billAmount = Double(billField.text!)
            let tip = billAmount! * tipPercentage
            let total = billAmount! + tip
            
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
        } else {
            
            UIView.animateWithDuration(0.4, animations: {
                self.amountsView.alpha = 0
                
                self.billField.frame = CGRectMake(xBillFieldPos, CGFloat(212), billFieldWidth, billFieldHeight)
            })
            
            initTipLabels()
        }
    }
    

}

