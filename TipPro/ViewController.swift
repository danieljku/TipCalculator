//
//  ViewController.swift
//  TipPro
//
//  Created by Daniel Ku on 6/21/16.
//  Copyright © 2016 Daniel Ku. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var tipAmountField: UITextField!
    @IBOutlet weak var totalAmountField: UITextField!
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func calculateTip(sender: AnyObject) {
        guard let billAmount = Double(billAmountField.text!) else{
            print("You did not enter a bill amount!")
            
            billAmountField.text = ""
            tipAmountField.text = ""
            totalAmountField.text = ""
            
            return
        }
        
        var tipPercent = 0.0
        
        switch tipSelector.selectedSegmentIndex{
        case 0:
            tipPercent = 0.15
        case 1:
            tipPercent = 0.18
        case 2:
            tipPercent = 0.20
        default:
            break
        }
        
        let roundedBillAmount = round(billAmount * 100) / 100
        let tipAmount = roundedBillAmount * tipPercent
        let roundedTipAmount = round(tipAmount * 100) / 100
        let totalAmount = roundedBillAmount + roundedTipAmount
        
        if(!billAmountField.editing){
            billAmountField.text = String(format: "%.2f", roundedBillAmount)
        }
        
        tipAmountField.text = String(format: "%.2f", roundedTipAmount)
        totalAmountField.text = String(format: "%.2f", totalAmount)
        
    }
    
}

