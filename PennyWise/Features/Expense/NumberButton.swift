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
    var lineWidth:CGFloat = 3

    @IBInspectable
    var fillColor:UIColor = #colorLiteral(red: 0.7843137255, green: 0.8509803922, blue: 0.8784313725, alpha: 1)
    @IBInspectable
    var strokeColor:UIColor = #colorLiteral(red: 0.3098039216, green: 0.3607843137, blue: 0.4117647059, alpha: 1)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setTitleColor(strokeColor, for: .normal)
    }

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
