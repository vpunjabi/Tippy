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
    var defaultSegIndex:Int = -1
    let defaults = UserDefaults.standard
    var locales:[String] = NSLocale.availableLocaleIdentifiers
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func valueExists(kVal: String) -> Bool {
        return defaults.object(forKey: kVal) != nil
    }
    
    func getCurrencySymbol() -> String {
        if valueExists(kVal: "currencySymbol"){
           return defaults.string(forKey: "currencySymbol")!
        }else{
            return NSLocale.current.currencySymbol!
        }
    }
    
    func getLanguageCode() -> String {
        if valueExists(kVal: "languageCode"){
            return defaults.string(forKey: "languageCode")!
        }else{
            return NSLocale.current.languageCode!
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        billField.placeholder = getCurrencySymbol()
        let curDefaultSegIndex = defaults.integer(forKey: "defaultTipIndex")
        if(defaultSegIndex != curDefaultSegIndex){
            defaultSegIndex = curDefaultSegIndex
            tipControl.selectedSegmentIndex = defaultSegIndex
        }
        calculateTip(NSNull.self);
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
        
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true

        formatter.currencySymbol = getCurrencySymbol()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        formatter.locale = Locale(identifier: NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.currencyCode.rawValue: defaults.string(forKey: "currencyCode")!]))
        
        tipLabel.text = formatter.string(from: tip as NSNumber)
        totalLabel.text = formatter.string(from: total as NSNumber)
        
//        tipLabel.text = String(format: "\(getCurrencySymbol())%.2f", arguments: [tip]);
//        totalLabel.text = String(format: "\(getCurrencySymbol())%.2f", arguments: [total]);
        //        formatter.locale = Locale(identifier: NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.currencyCode.rawValue: defaults.string(forKey: "currencyCode")!]))
        
        //        formatter.locale = Locale(identifier: NSLocale.init(localeIdentifier: defaults.string(forKey: "currencyCode")!).localeIdentifier)
        
        //        tipLabel.text = formatter.string(from: NSNumber.init(value: tip))
        //        formatter.currencyCode = defaults.string(forKey: "currencyCode")!
    }
}

