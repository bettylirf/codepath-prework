//
//  ViewController.swift
//  Prework
//
//  Created by Ruofan on 2022/1/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var customizedTipPercent: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
    }

    @IBAction func calculateTip(_ sender: Any) {
        //Get the bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //Get tip by multiplying bill * tip percentage
        //Get total by adding bill and tip
        let tipPercentages = [0.15,0.18,0.2]
        var tip: Double = 0.00
        if(tipControl.selectedSegmentIndex == 3){
            let customizedPercent = Double(customizedTipPercent.text!) ?? 0
            tip = bill * (customizedPercent/100.0)
            
        } else{
            tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        }
        let total = bill + tip
        
        //Update tip amount label
        tipAmountLabel.text = String(format: "$%.2f",tip)
        //Update total label
        totalLabel.text = String(format: "$%.2f",total)
    }
    
}

