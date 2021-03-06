//
//  StyleKit.swift
//  Swift Material Design Color
//
//  Created by Audrey Li on 4/3/15.
//  Copyright (c) 2015 Shomigo.com. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//



import UIKit

public class StyleKit : NSObject {

    //// Drawing Methods

    public class func drawButtonStar(#frame: CGRect, starColor: UIColor, circleColor: UIColor) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()


        //// Shadow Declarations
        let shadow = UIColor.blackColor().colorWithAlphaComponent(0.37)
        let shadowOffset = CGSizeMake(3.1, 3.1)
        let shadowBlurRadius: CGFloat = 5

        //// Circle Drawing
        var circlePath = UIBezierPath(ovalInRect: CGRectMake(frame.minX + 9, frame.minY + 9, 71, 71))
        CGContextSaveGState(context)
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, (shadow as UIColor).CGColor)
        circleColor.setFill()
        circlePath.fill()
        CGContextRestoreGState(context)



        //// Star Drawing
        var starPath = UIBezierPath()
        starPath.moveToPoint(CGPointMake(frame.minX + 44.5, frame.minY + 29.5))
        starPath.addLineToPoint(CGPointMake(frame.minX + 47.86, frame.minY + 39.87))
        starPath.addLineToPoint(CGPointMake(frame.minX + 58.77, frame.minY + 39.86))
        starPath.addLineToPoint(CGPointMake(frame.minX + 49.94, frame.minY + 46.27))
        starPath.addLineToPoint(CGPointMake(frame.minX + 53.32, frame.minY + 56.64))
        starPath.addLineToPoint(CGPointMake(frame.minX + 44.5, frame.minY + 50.22))
        starPath.addLineToPoint(CGPointMake(frame.minX + 35.68, frame.minY + 56.64))
        starPath.addLineToPoint(CGPointMake(frame.minX + 39.06, frame.minY + 46.27))
        starPath.addLineToPoint(CGPointMake(frame.minX + 30.23, frame.minY + 39.86))
        starPath.addLineToPoint(CGPointMake(frame.minX + 41.14, frame.minY + 39.87))
        starPath.closePath()
        starColor.setFill()
        starPath.fill()
    }

}

@objc protocol StyleKitSettableImage {
    func setImage(image: UIImage!)
}

@objc protocol StyleKitSettableSelectedImage {
    func setSelectedImage(image: UIImage!)
}
