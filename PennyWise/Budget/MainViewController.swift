//
//  MainViewController.swift
//  PennyWise
//
//  Created by Mohammed Rokon Uddin on 12/10/17.
//  Copyright © 2017 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // Graph view displays on landscape

    @IBOutlet var graphView: GraphView!

    // Shows arc and pointer to see percentage spent overall

    @IBOutlet weak var summaryView: SummaryView!

    // Save bar button items in landscape
    private var rightBarButtonItem:UIBarButtonItem?
    private var leftBarButtonItem:UIBarButtonItem?

    private var budgetTableViewController:BudgetTableViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        rightBarButtonItem = navigationItem.rightBarButtonItem
        leftBarButtonItem = navigationItem.leftBarButtonItem
        
        let image = #imageLiteral(resourceName: "pennywise_logo")
        navigationItem.titleView = UIImageView(image: image)
        calculateBudget()
    }

    private func calculateBudget() {
        // recalculate totals
        let totalSpent = categories.reduce(0, {$0 + $1.spent} )
        let totalBudget = categories.reduce(0, {$0 + $1.budget} )
        if totalBudget > 0 {
            summaryView.percentSpent = totalSpent / totalBudget
        }
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

        if size.width > size.height {
            // add graph view to the screen
            // and define the constraints
            view.addSubview(graphView)
            graphView.translatesAutoresizingMaskIntoConstraints = false
            graphView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            graphView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            graphView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            graphView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true

            // hide navigation bar buttons on landscape
            navigationItem.rightBarButtonItem = nil
            navigationItem.leftBarButtonItem = nil

        } else {
            graphView.removeFromSuperview()

            // show navigation bar buttons
            navigationItem.rightBarButtonItem = rightBarButtonItem
            navigationItem.leftBarButtonItem = leftBarButtonItem
        }

    }




}
