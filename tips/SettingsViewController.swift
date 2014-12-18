//
//  SettingsViewController.swift
//  tips
//
//  Created by eric levin on 12/18/14.
//  Copyright (c) 2014 eric levin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var defaultSettings: UISegmentedControl!

    @IBAction func onTouch(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func defaultSettingsChanged(sender: UISegmentedControl) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultSettings.selectedSegmentIndex, forKey: "tipIndex")
        defaults.synchronize()
    }
    override func viewWillAppear(animated: Bool) {
        
        var currentIndex = NSUserDefaults.standardUserDefaults().integerForKey("tipIndex")
        
        defaultSettings.selectedSegmentIndex = currentIndex
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
