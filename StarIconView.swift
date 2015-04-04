//
//  StarIconView.swift
//  010-Swift-Material-Design-Color-Kit
//
//  Created by Audrey Li on 3/31/15.
//  Copyright (c) 2015 UIColle. All rights reserved.
//

import UIKit

@IBDesignable
class StarIconView: UIView {
    
    var starColor:UIColor = UIColor.whiteColor(){
        didSet {
            setNeedsDisplay()
        }
    }
    var circleColar: UIColor = UIColor.redColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func layoutSubviews() {
        backgroundColor = UIColor.clearColor()
      
        
    }
    override func drawRect(rect: CGRect) {
        StyleKit.drawButtonStar(frame: bounds, starColor: starColor, circleColor: circleColar)
    }
    
}
