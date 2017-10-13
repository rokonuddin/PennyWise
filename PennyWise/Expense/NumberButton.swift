//
//  NumberButton.swift
//  PennyWise
//
//  Created by Mohammed Rokon Uddin on 13/10/17.
//  Copyright © 2017 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit

@IBDesignable
class NumberButton: UIButton {


    @IBInspectable
    var lineWidth:CGFloat = 2

    @IBInspectable
    var fillColor:UIColor = UIColor.red
    @IBInspectable
    var strokeColor:UIColor = UIColor.blue

    override func draw(_ rect: CGRect) {
        let insetRect = rect.insetBy(dx: lineWidth/2, dy: lineWidth/2)
        let path = UIBezierPath(ovalIn: insetRect)
        path.lineWidth = lineWidth

        fillColor.setFill()
        path.fill()

        strokeColor.setStroke()
        path.stroke()
    }


}
