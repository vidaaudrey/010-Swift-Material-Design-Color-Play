//
//  Color.swift
//  010-Swift-Material-Design-Color-Kit
//
//  Created by Audrey Li on 3/27/15.
//  Copyright (c) 2015 UIColle. All rights reserved.
//

import Foundation
import UIKit

class MDColor{
    
    var name: String!
    var hex: String!
    var subNumber: String!
    
    init (name:String, hex: String, subNumber: String){
        self.name = name
        self.hex = hex
        self.subNumber = subNumber
    }
    
    
    // Palette has a few different colors. For it to use the same MDColor class, we add a magic subNumber string. Just convenient this way
    init(name: String, hex: String) {
        self.name = name
        self.hex = hex
        self.subNumber = "Alpha Related"
    }
    func getColor() -> UIColor {
        return Color(hex: hex)
    }
  
    
}

