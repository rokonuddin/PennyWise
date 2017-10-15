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
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var graphView: GraphView!
    
    // Shows arc and pointer to see percentage spent overall
    
    @IBOutlet weak var summaryView: SummaryView!
    
    // Save bar button items in landscape
    private var rightBarButtonItem:UIBarButtonItem?
    private var leftBarButtonItem:UIBarButtonItem?
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let _ = segue.identifier else { return }
        
        guard let navigationController = segue.destination as? UINavigationController else { return }
        if let controller = navigationController.viewControllers.first as? ExpenseViewController,
            let indexPath = sender as? IndexPath {
            controller.selectedCategory = categories[indexPath.row]
            controller.delegate = self
        }
    }
    
}

extension MainViewController: UITableViewDataSource {
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BudgetCell", for: indexPath) as! BudgetCell
        cell.category = categories[indexPath.row]
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    
    // MARK: - Table view Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async { [weak self] in
            self?.performSegue(withIdentifier: "CategoryExpense", sender: indexPath)
        }
    }
}

extension MainViewController: ExpenseViewControllerDelegate {
    func expenseViewController(expenseViewController: ExpenseViewController, didExpenseCategory category: Category?, amount: Double) {
        dismiss(animated: true, completion: {
            if let category = category {
                if let index = categories.index(of: category) {
                    let indexPath = IndexPath(item: index, section: 0)
                    
                    category.spent = category.spent + Float(amount)
                    self.calculateBudget()
                    
                    UIView.animate(withDuration: 0.3, animations: { [weak self] in
                        self?.tableView.scrollToRow(at: indexPath, at: .none, animated: false)
                        }, completion: { [weak self] _ in
                            self?.tableView.reloadRows(at: [indexPath], with: .left)
                    })
                }
            }
        })
    }
    
    
}
