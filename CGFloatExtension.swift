//
//  File.swift
//  CustomViewControllerTransition
//
//  Created by Audrey Li on 3/27/15.
//  Copyright (c) 2015 UIColle. All rights reserved.
//

import Foundation
import CoreGraphics

let π = CGFloat(M_PI)

public extension CGFloat {
    
    // between 0.0 and 1.0, inclusive
    public static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    //between min and max, inclusive
    public static func random(#min: CGFloat, max: CGFloat) -> CGFloat {
        assert(min < max)
        return CGFloat.random() * (max - min) + min
    }
    // either 1.0 or -1.0
    public static func randomSign() -> CGFloat {
        return (arc4random_uniform(2) == 0) ? 1.0 : -1.0
    }
    
    public func degreesToRadians() -> CGFloat {
        return π * self / 180.0
    }
    
    
    public func radiansToDegrees() -> CGFloat {
        return self * 180.0 / π
    }
    
    // the float value stays betwen, inclusive
    public func clamped(v1: CGFloat, _ v2: CGFloat) -> CGFloat {
        let min = v1 < v2 ? v1 : v2
        let max = v1 > v2 ? v1 : v2
        return self < min ? min : (self > max ? max : self)
    }
    

    public mutating func clamp(v1: CGFloat, _ v2: CGFloat) -> CGFloat {
        self = clamped(v1, v2)
        return self
    }

    public func sign() -> CGFloat {
        return (self >= 0.0) ? 1.0 : -1.0
    }

    
}

// between -π and π
public func shortestAngleBetween(angle1: CGFloat, angle2: CGFloat) -> CGFloat {
    let twoπ = π * 2.0
    var angle = (angle2 - angle1) % twoπ
    if (angle >= π) {
        angle = angle - twoπ
    }
    if (angle <= -π) {
        angle = angle + twoπ
    }
    return angle
}