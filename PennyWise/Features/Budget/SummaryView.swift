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

    var percentSpent: Float = 0 {
        didSet {
            rotatePointer()
        }
    }
    
    var lineWidth: CGFloat {
        return bounds.height / 4
    }
    
    let margin: CGFloat = 30
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
    
    private func rotatePointer() {
        if percentSpent > 1 {
            percentSpent = 1
        }
        let angle = -π/2 + π * CGFloat(percentSpent)
        let transform = CGAffineTransform(rotationAngle: angle)
        pointerLayer.setAffineTransform(transform)
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
        
       guard let newCGPath = CGPath(__byStroking: path.cgPath,
                               transform: nil,
                               lineWidth: path.lineWidth,
                               lineCap: path.lineCapStyle,
                               lineJoin: path.lineJoinStyle,
                               miterLimit: path.miterLimit)
        else { return }
        
        let newPath = UIBezierPath(cgPath: newCGPath)
        UIColor.white.setFill()
        newPath.fill()
        
        newPath.addClip()
        
        drawGradient(colors: [appGreenColor, UIColor.white], startingPoint: CGPoint(x: 0, y: rect.height), endPoint: CGPoint(x: rect.midX, y: rect.midY))
        drawGradient(colors: [UIColor.white, appRedColor], startingPoint: CGPoint(x: rect.midX, y: rect.midY), endPoint: CGPoint(x: rect.width, y: rect.height))
        
        UIColor.lightGray.setStroke()
        newPath.lineWidth = 2
        newPath.stroke()
        
    }
}
