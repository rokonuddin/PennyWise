//
//  UIView+Gradient.swift
//  PennyWise
//
//  Created by Rokon Uddin on 10/14/17.
//  Copyright © 2017 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit

extension UIView {
    
    func drawGradient(colors: [UIColor], startingPoint: CGPoint, endPoint: CGPoint) {
        
        let colors = colors.map { $0.cgColor }
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorLocations: [CGFloat] = [0.0, 1.0]
        let gradient = CGGradient.init(colorsSpace: colorSpace, colors: colors as CFArray, locations: colorLocations)
        
        UIGraphicsGetCurrentContext()?
            .drawLinearGradient(gradient!, start: startingPoint, end: endPoint, options: [])
        
    }
}
