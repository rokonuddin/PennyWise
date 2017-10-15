//
//  BudgetCell.swift
//  PennyWise
//
//  Created by Mohammed Rokon Uddin on 12/10/17.
//  Copyright © 2017 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit

class BudgetCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var spentLabel: UILabel!
    @IBOutlet var budgetView: BudgetView!

    var category: Category? {
        didSet {
            if let category = category {
                nameLabel.text = category.name
                let amountRemaining = Int(category.budget - category.spent)
                if amountRemaining >= 0 {
                    spentLabel.text = "$\(amountRemaining) left"
                } else {
                    spentLabel.text = "- $\(abs(amountRemaining)) !"
                }

                if category.budget > 0 {
                    budgetView.percent = category.spent / category.budget
                }
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
