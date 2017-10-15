//
//  ExpenseViewController.swift
//  PennyWise
//
//  Created by Mohammed Rokon Uddin on 13/10/17.
//  Copyright © 2017 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CategoryCell"

protocol ExpenseViewControllerDelegate {
    func expenseViewController(expenseViewController:ExpenseViewController,
                               didExpenseCategory category:Category?, amount:Double)
}

class ExpenseViewController: UIViewController {
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate: ExpenseViewControllerDelegate?
    
    fileprivate var userIsInTheMiddleOfTyping = false {
        didSet {
            if !userIsInTheMiddleOfTyping { 
                userIsInTheMiddleOfFloatingPointNummer = false
            }
        }
    }
    
    var selectedCategory: Category?
    
    fileprivate var userIsInTheMiddleOfFloatingPointNummer = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.allowsMultipleSelection = false
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
    
    @IBAction func cancelButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true) {}
    }
    
    @IBAction func doneButtonAction(_ sender: UIButton) {
        delegate?.expenseViewController(expenseViewController: self, didExpenseCategory:
            selectedCategory, amount:displayValue)
    }
    
    
    fileprivate  var displayValue: Double {
        get {
            return Double(displayLabel.text ?? "0") ?? 0
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    
   fileprivate func setBtnDone(_ enabled:Bool) {
    doneButton.isEnabled = enabled
    }
    
}

extension ExpenseViewController: UICollectionViewDataSource {
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoryCell
        cell.category = categories[indexPath.row]
        return cell
    }
}

extension ExpenseViewController: UICollectionViewDelegate {
    
    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        guard let cell = cell as? CategoryCell else { return }
        
        if cell.category?.name == selectedCategory?.name {
            collectionView.selectItem(at: indexPath, animated: true,
                                      scrollPosition: .centeredHorizontally)
            cell.isSelected = true
            cell.setNeedsDisplay()
            setBtnDone(true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        selectedCategory = categories[indexPath.row]
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.setNeedsDisplay()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCategory = categories[indexPath.row]
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.setNeedsDisplay()
        setBtnDone(true)
    }
}
