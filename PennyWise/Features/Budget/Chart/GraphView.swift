//
//  GraphView.swift
//  PennyWise
//
//  Created by Mohammed Rokon Uddin on 13/10/17.
//  Copyright © 2017 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit

@IBDesignable
class GraphView: UIView {
    let chartColors = [
        UIColor(red: 1.0, green: 107/255, blue: 107/255, alpha: 1.0),
        UIColor(red: 155/255, green: 224/255, blue: 172/255, alpha: 1.0),
        UIColor(red: 136/255, green: 161/255, blue: 212/255, alpha: 1.0),
        UIColor(red: 1.0, green: 172/255, blue: 99/255, alpha: 1.0),
        UIColor(red: 135/255, green: 218/255, blue: 230/255, alpha: 1.0),
        UIColor(red: 250/255, green: 250/255, blue: 147/255, alpha: 1.0)]
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let context = UIGraphicsGetCurrentContext()

        let totalSpent = categories.reduce(0, {$0 + $1.spent})
        guard  totalSpent > 0 else { return }
        
        let diameter = min(bounds.width, bounds.height)
        let margin: CGFloat = 20
        let circle = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: diameter, height: diameter).insetBy(dx: margin, dy: margin))
        let tranform = CGAffineTransform(translationX: bounds.width/2 - diameter/2, y: 0)
        circle.apply(tranform)
        
        let workingCategory = categories.filter { $0.spent > 0 }
        
        for (index, _) in workingCategory.enumerated() {
            let percent = CGFloat(workingCategory[index].spent/totalSpent)
            let angle = percent * 2 * π
            
            let slice = UIBezierPath()
            let radius = diameter / 2 - margin
            let centerPoint = center
            
            slice.move(to: centerPoint)
            slice.addLine(to: CGPoint(x: centerPoint.x + radius, y: centerPoint.y))
            slice.addArc(withCenter: centerPoint, radius: radius, startAngle: 0, endAngle: angle, clockwise: true)
            slice.close()
            chartColors[index].setFill()
            slice.fill()
            
            context?.translateBy(x: centerPoint.x, y: centerPoint.y)
            context?.rotate(by: angle)
            context?.translateBy(x: -centerPoint.x, y: -centerPoint.y)
        }
        
        circle.stroke()
    }
}
