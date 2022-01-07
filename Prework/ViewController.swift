//
//  ViewController.swift
//  Prework
//
//  Created by Bob Makazhu on 1/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var eachPerson: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.title = "Tip Calculator"
        billAmountTextField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get Total by multiplying tip * tipPerentage
        let tipPercentage = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update Tip Amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func calculateEach(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let splitValue = Double(Int(splitSlider.value))
        
        let each = total / splitValue
        eachPerson.text = String(format: "$%.2f", each)
        let splitDisplay = Int(splitSlider.value)
        splitLabel.text = "Split : " + String(splitDisplay)
    }
}

