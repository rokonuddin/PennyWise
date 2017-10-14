//
//  SummaryView.swift
//  PennyWise
//
//  Created by Mohammed Rokon Uddin on 12/10/17.
//  Copyright © 2017 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit

@IBDesignable
class SummaryView: UIView {

    var percentSpent: Float = 0
    
    var lineWidth: CGFloat {
        return bounds.height / 4
    }
    
    let margin: CGFloat = 20
    let pointerLayer = CAShapeLayer()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        layer.addSublayer(pointerLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let path = createPointerPat()
        pointerLayer.path = path.cgPath
        
        pointerLayer.fillColor = darkViewColor.cgColor
        pointerLayer.bounds = path.bounds
        pointerLayer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        pointerLayer.position = CGPoint(x: bounds.midX, y: bounds.height - margin)
    }
    
    func createPointerPat() -> UIBezierPath {
        let pointerHeight = bounds.height - lineWidth - margin
        let pointerWidth: CGFloat = 18
        let pointerPath = UIBezierPath()
        pointerPath.move(to: CGPoint(x: pointerWidth/2, y: 0))
        
        pointerPath.addCurve(to: CGPoint(x: pointerWidth/2, y: pointerHeight), controlPoint1: CGPoint(x: pointerWidth/2, y: 0), controlPoint2: CGPoint(x: -pointerWidth, y: pointerHeight))
        
        pointerPath.addCurve(to: CGPoint(x: pointerWidth/2, y: 0), controlPoint1: CGPoint(x: pointerWidth*2, y: pointerHeight), controlPoint2: CGPoint(x: pointerWidth/2, y: 0))
        return pointerPath
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let arcCenter = CGPoint(x: rect.midX, y: rect.height - margin)
        let radius = rect.height - lineWidth/2 - margin*2
        
        let startAngle: CGFloat = π
        let endAngle: CGFloat = 0
        
        let path = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.lineWidth = lineWidth
        appGreenColor.setStroke()
        path.stroke()
        
    }
}
