//
//  DrawIcon.swift
//  PennyWise
//
//  Created by Rokon Uddin on 10/14/17.
//  Copyright © 2017 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit

class DrawIcon {
    
    class func drawFunIcon() -> UIBezierPath{
        let size  = CGSize(width: 400, height: 400)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        let outerCircle = UIBezierPath(ovalIn: CGRect(x: 46, y: 46, width: 310, height: 310))
        let eye1 = UIBezierPath(ovalIn: CGRect(x: 138, y: 126, width: 36, height: 72))
        let eye2 = UIBezierPath(ovalIn: CGRect(x: 223, y: 126, width: 36, height: 72))
        let mouth = UIBezierPath()

        mouth.move(to: CGPoint(x: 136, y: 250))
        mouth.addLine(to: CGPoint(x: 265, y: 250))
        mouth.addCurve(to: CGPoint(x: 135, y: 250),
                       controlPoint1: CGPoint(x: 240, y: 300),
                       controlPoint2: CGPoint(x: 150, y: 300))
        mouth.close()
        mouth.lineJoinStyle = .round
        
        
        let path = UIBezierPath()
        path.append(outerCircle)
        path.append(eye1)
        path.append(eye2)
        path.append(mouth)
        
        UIGraphicsEndImageContext()
        
        return path
    }
}
