//
//  CategoryCell.swift
//  PennyWise
//
//  Created by Mohammed Rokon Uddin on 13/10/17.
//  Copyright © 2017 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    
    var category: Category?
    
    @IBInspectable var lineWidth: CGFloat = 2
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if isSelected {
            UIColor.red.setStroke()
        } else {
            UIColor.green.setStroke()
        }
        
        let edge = UIBezierPath(roundedRect: rect.insetBy(dx: lineWidth/2, dy: lineWidth/2), cornerRadius: 10)
        edge.lineWidth = lineWidth
        edge.stroke()
        
        guard let name = category?.name  else { return }
        
        let frame = rect.insetBy(dx: 5, dy: 5)
        switch name {
            case "Utilities":
            Icons.drawUtilities(frame: frame, isSelected: isSelected)
            case "Fun":
            Icons.drawFun(frame: frame, isSelected: isSelected)
            case "Groceries":
            Icons.drawGroceries(frame: frame, isSelected: isSelected)
            case "Pet":
            Icons.drawPet(frame: frame, isSelected: isSelected)
            case "Misc":
            Icons.drawMisc(frame: frame, isSelected: isSelected)
            case "Auto":
            Icons.drawAutoIcon(frame: frame, isSelected: isSelected)
            default:()
        }
        
    }
    
    private func scalePath(path: UIBezierPath, size: CGSize) {
        
        let scale = size.height / path.bounds.size.height * 0.5
        path.apply(CGAffineTransform(scaleX: scale, y: scale))
        path.apply(CGAffineTransform.init(translationX: -path.bounds.origin.x, y: -path.bounds.origin.y))
        path.apply(CGAffineTransform.init(translationX: size.width/2 - path.bounds.width/2, y: size.height/2 - path.bounds.height/2))
    }
}
