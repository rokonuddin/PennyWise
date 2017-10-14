//
//  ExpenseViewController.swift
//  PennyWise
//
//  Created by Mohammed Rokon Uddin on 13/10/17.
//  Copyright © 2017 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit

class ExpenseViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    fileprivate var userIsInTheMiddleOfTyping = false {
        didSet {
            if !userIsInTheMiddleOfTyping { 
                userIsInTheMiddleOfFloatingPointNummer = false
            }
        }
    }
    fileprivate var userIsInTheMiddleOfFloatingPointNummer = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func touchDigit(_ sender: UIButton) {
        var digit = sender.currentTitle!
        
        if digit == "↩︎" {
            let srt = displayLabel.text ?? "0"
            displayLabel.text = String(srt.dropLast())
            if displayLabel.text?.characters.count == 0 {
                userIsInTheMiddleOfTyping = false
            }
            return
        }
        
        if digit == "." {
            if userIsInTheMiddleOfFloatingPointNummer {
                return
            }
            
            if !userIsInTheMiddleOfTyping {
                digit = "0."
            }
            userIsInTheMiddleOfFloatingPointNummer = true
        }
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = displayLabel.text!
            displayLabel.text = textCurrentlyInDisplay + digit
        }else{
            displayLabel.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    fileprivate  var displayValue: Double {
        get {
            return Double(displayLabel.text ?? "0") ?? 0
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    

    @IBAction func cancelButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true) {}
    }

    @IBAction func doneButtonAction(_ sender: UIButton) {
        print("Value: ", displayValue)
    }
    
}
