//
//  ViewController.swift
//  Tippy
//
//  Created by admin on 7/13/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipStrLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalStrLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let defaultSegIndex = defaults.integer(forKey: "defaultTipIndex")
        tipControl.selectedSegmentIndex = defaultSegIndex
        
        tipControl.tintColor = UIColor(red: CGFloat(defaults.float(forKey: "redColorSlider")), green: CGFloat(defaults.float(forKey: "greenColorSlider")), blue: CGFloat(defaults.float(forKey: "blueColorSlider")), alpha: 1.0)
        
        tipStrLabel.textColor = UIColor(red: CGFloat(defaults.float(forKey: "redColorSlider")), green: CGFloat(defaults.float(forKey: "greenColorSlider")), blue: CGFloat(defaults.float(forKey: "blueColorSlider")), alpha: 1.0)
        
        tipLabel.textColor = UIColor(red: CGFloat(defaults.float(forKey: "redColorSlider")), green: CGFloat(defaults.float(forKey: "greenColorSlider")), blue: CGFloat(defaults.float(forKey: "blueColorSlider")), alpha: 1.0)
        
        totalStrLabel.textColor = UIColor(red: CGFloat(defaults.float(forKey: "redColorSlider")), green: CGFloat(defaults.float(forKey: "greenColorSlider")), blue: CGFloat(defaults.float(forKey: "blueColorSlider")), alpha: 1.0)
        
        totalLabel.textColor = UIColor(red: CGFloat(defaults.float(forKey: "redColorSlider")), green: CGFloat(defaults.float(forKey: "greenColorSlider")), blue: CGFloat(defaults.float(forKey: "blueColorSlider")), alpha: 1.0)
        
        billField.textColor = UIColor(red: CGFloat(defaults.float(forKey: "redColorSlider")), green: CGFloat(defaults.float(forKey: "greenColorSlider")), blue: CGFloat(defaults.float(forKey: "blueColorSlider")), alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true);
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.25];
        let bill = Double(billField.text!) ?? 0 ;
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex];
        let total = bill + tip;
        
        tipLabel.text = String(format: "$%.2f", arguments: [tip]);
        totalLabel.text = String(format: "$%.2f", arguments: [total]);
    }
}

