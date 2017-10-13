//
//  Category.swift
//  PennyWise
//
//  Created by Mohammed Rokon Uddin on 13/10/17.
//  Copyright © 2017 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit

class Category: Equatable {
    var name: String
    var budget: Float
    var spent: Float

    lazy var image: UIImage? = {
        UIImage(named: "Icon" + self.name)
    }()

    init(name: String, budget: Float, spent: Float) {
        self.name = name
        self.budget = budget
        self.spent = spent
    }
}

func == (lhs: Category, rhs: Category) -> Bool {
    return lhs.name == rhs.name &&
        lhs.budget == rhs.budget &&
        lhs.spent == rhs.spent
}

let categories = [
    Category(name: "Auto", budget: 2000, spent: 1200),
    Category(name: "Utilities", budget: 400, spent: 600),
    Category(name: "Fun", budget: 1200, spent: 1000),
    Category(name: "Groceries", budget: 600, spent: 800),
    Category(name: "Pet", budget: 200, spent: 100),
    Category(name: "Misc", budget: 800, spent: 400)
]
