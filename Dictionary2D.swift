//
//  Dictionary2D.swift
//  010-Swift-Material-Design-Color-Kit
//
//  Created by Audrey Li on 3/27/15.
//  Copyright (c) 2015 UIColle. All rights reserved.
//

import Foundation

struct Dict2D<X:Hashable,Y:Hashable,V> {
    var values = [X:[Y:V]]()
    subscript (x:X, y:Y)->V? {
        get { return values[x]?[y] }
        set {
            if values[x] == nil {
                values[x] = [Y:V]()
            }
            values[x]![y] = newValue
        }
    }
}


//var a = Dict2D<Int,Int,Float>()
//a[1,2] = 12
//println(a[1,2]) // Optional(12.0)
//println(a[0,2]) // nil
