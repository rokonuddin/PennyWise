//
//  BudgetView.swift
//  PennyWise
//
//  Created by Mohammed Rokon Uddin on 12/10/17.
//  Copyright © 2017 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit

//@IBDesignable
class BudgetView: UIView {

    var percent: Float = 0.5 {
        didSet {
            setNeedsDisplay()
        }
    }

    //@IBInspectable
    var percentLineColor: UIColor = appGreenColor
    //@IBInspectable
    var percentWarningLineColor: UIColor = appOrangeColor
    //@IBInspectable
    var percentDangerLineColor:UIColor = appRedColor

    //@IBInspectable
    var lineWidth: CGFloat = 13

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let path = UIBezierPath()
        path.lineWidth = lineWidth

        path.move(to: CGPoint(x: 0, y: rect.height/2))

        let end = rect.width * CGFloat(percent)
        path.addLine(to: CGPoint(x: end, y: rect.height/2))

        if percent >= 1.0 {
            percentDangerLineColor.setStroke()
        } else if percent > 0.8 {
            percentWarningLineColor.setStroke()
        } else {
            percentLineColor.setStroke()
        }

        path.stroke()
    }


}
