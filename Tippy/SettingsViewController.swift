//
//  SettingsViewController.swift
//  Tippy
//
//  Created by admin on 8/6/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var colorPreview: UIView!
    @IBOutlet weak var redColorSlider: UISlider!
    @IBOutlet weak var greenColorSlider: UISlider!
    @IBOutlet weak var blueColorSlider: UISlider!
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    let defaults = UserDefaults.standard
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaultTipIndex = defaults.integer(forKey: "defaultTipIndex")
        defaultTipControl.selectedSegmentIndex = defaultTipIndex
        
        var redColor: Float = 0
        if isKeyPresentInUserDefaults(key: "redColorSlider"){
            redColor = defaults.float(forKey: "redColorSlider")
        }
        redColorSlider.value = Float(redColor)
        
        var greenColor: Float = 0
        if isKeyPresentInUserDefaults(key: "greenColorSlider"){
            greenColor = defaults.float(forKey: "greenColorSlider")
        }
        greenColorSlider.value = Float(greenColor)
        
        var blueColor: Float = 0.5
        if isKeyPresentInUserDefaults(key: "blueColorSlider"){
            blueColor = defaults.float(forKey: "blueColorSlider")
        }
        blueColorSlider.value = Float(blueColor)
        
        colorPreview.backgroundColor = UIColor(red: CGFloat(redColor), green: CGFloat(greenColor), blue: CGFloat(blueColor), alpha: 1.0)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func setDefaultTipPercentage(_ sender: AnyObject) {
        defaults.set(defaultTipControl.selectedSegmentIndex, forKey: "defaultTipIndex")
        defaults.synchronize()
    }
    
    @IBAction func setRedColor(_ sender: AnyObject) {
        colorPreview.backgroundColor = UIColor(red: CGFloat(redColorSlider.value), green: CGFloat(greenColorSlider.value), blue: CGFloat(blueColorSlider.value), alpha: 1.0)
        defaults.set(redColorSlider.value, forKey: "redColorSlider")
        defaults.synchronize()
    }
    
    @IBAction func setGreenColor(_ sender: AnyObject) {
        colorPreview.backgroundColor = UIColor(red: CGFloat(redColorSlider.value), green: CGFloat(greenColorSlider.value), blue: CGFloat(blueColorSlider.value), alpha: 1.0)
        defaults.set(greenColorSlider.value, forKey: "greenColorSlider")
        defaults.synchronize()
    }
    
    @IBAction func setBlueColor(_ sender: AnyObject) {
        colorPreview.backgroundColor = UIColor(red: CGFloat(redColorSlider.value), green: CGFloat(greenColorSlider.value), blue: CGFloat(blueColorSlider.value), alpha: 1.0)
        defaults.set(blueColorSlider.value, forKey: "blueColorSlider")
        defaults.synchronize()
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
