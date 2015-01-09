//
//  ViewController.swift
//  tips
//
//  Created by eric levin on 12/14/14.
//  Copyright (c) 2014 eric levin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billBackgroundView: UIView!
    @IBOutlet weak var topBarLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var topBarRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomBarLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomBarRightConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        
        self.title = "Tip Calculator"
        
        self.billBackgroundView.layer.cornerRadius = 10.0
        self.billBackgroundView.layer.zPosition = -1
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        var currentIndex = NSUserDefaults.standardUserDefaults().integerForKey("tipIndex")
        
        tipControl.selectedSegmentIndex = currentIndex
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22];
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        

        
        var formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        // formatter.locale = NSLocale.currentLocale() // This is the default
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
        
        
//        tipLabel.text = String(format: "$%.2f", tip)
//        totalLabel.text = String(format: "$%.2f", total)
        

        var newConstraintValue = CGFloat(0)
        
        
        if(tipControl.selectedSegmentIndex == 0) {
            newConstraintValue = CGFloat(50)
        } else if(tipControl.selectedSegmentIndex == 1) {
            newConstraintValue = CGFloat(30)
        } else {
            newConstraintValue = CGFloat(10)
        }
        
        UIView.animateWithDuration(0.7) {
            self.topBarRightConstraint.constant = newConstraintValue
            self.topBarLeftConstraint.constant = newConstraintValue
            self.bottomBarRightConstraint.constant = newConstraintValue * 2
            self.bottomBarLeftConstraint.constant = newConstraintValue * 2
            self.view.layoutIfNeeded()
        }

        
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

