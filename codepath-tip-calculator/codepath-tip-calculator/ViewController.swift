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
    
    // Reset Tip Labels
    func initTipLabels() {
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    
    
    
    // Show Percent Controls
    @IBAction func percentButton(sender: AnyObject) {
        // Hide Keyboard
        view.endEditing(true)
        
        // Animate Percent Controls In
        UIView.animateWithDuration(0.3, animations: {
            self.percentView.frame = CGRectMake(0, 0, self.percentView.frame.size.height, self.percentView.frame.size.height)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Position Bill Field at the center
        let xBillFieldPos = billField.frame.origin.x
        let billFieldHeight = billField.frame.size.height
        let billFieldWidth = billField.frame.size.width
        
        // Center Bill Field
        billField.frame = CGRectMake(xBillFieldPos, 230, billFieldWidth, billFieldHeight)
        
        // Autofocus Keyboard on Load
        self.billField.becomeFirstResponder()
        
        // Hide amounts view
        self.amountsView.alpha = 0
        
        // Set Tip Control Styles
        tipControl.frame = CGRectMake(45, 300, 325, 100)
        
        // Reset Tip Labels
        initTipLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Changing Status Bar Color to White
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    // Hide Keyboard When Clicking Outside of Form
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    // Calculate Tip
    @IBAction func onEditingChanged(sender: AnyObject) {
        // Get Width and Height of Main screen
        let bounds = UIScreen.mainScreen().bounds
        let boundsHeight = bounds.size.height
        
        // Position Bill Field at the center
        let xBillFieldPos = billField.frame.origin.x
        let billFieldHeight = billField.frame.size.height
        let billFieldWidth = billField.frame.size.width
        
        // Get percentage amount
        var tipPercentages = [0.18,0.2,0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        // Update Percentage Label to Match Segment Controls
        percentLabel.text = tipControl.titleForSegmentAtIndex(tipControl.selectedSegmentIndex)
        
        // Check Bill Field Has Content
        if billField.text != "" {
            
            let billAmount = Double(billField.text!)
            let tip = billAmount! * tipPercentage
            let total = billAmount! + tip
            
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
            
            // Show Keyboard
            self.billField.becomeFirstResponder()
            
            // Animate Tip Total Fields and Bill Fields
            UIView.animateWithDuration(0.3, animations: {
                self.amountsView.alpha = 1
                
                self.billField.frame = CGRectMake(xBillFieldPos, CGFloat(130), billFieldWidth, billFieldHeight)
                
                self.percentView.frame = CGRectMake(0, boundsHeight, self.percentView.frame.size.height, self.percentView.frame.size.height)
            })
            
        } else {
            
            // Reset Tip Labels
            initTipLabels()
            
            // Hide Labels
            UIView.animateWithDuration(0.4, animations: {
                self.amountsView.alpha = 0
                
                self.billField.frame = CGRectMake(xBillFieldPos, CGFloat(212), billFieldWidth, billFieldHeight)
            })
            
            
        }
    }
    

}

