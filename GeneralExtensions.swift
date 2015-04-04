//
//  Extensions.swift
//  010-Swift-Material-Design-Color-Kit
//
//  Created by Audrey Li on 3/27/15.
//  Copyright (c) 2015 UIColle. All rights reserved.
//

import Foundation

extension String {
    
    subscript (i: Int) -> Character {
        return self[advance(self.startIndex, i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        return substringWithRange(Range(start: advance(startIndex, r.startIndex), end: advance(startIndex, r.endIndex)))
    }
    
    func explode (separator: Character) -> [String] {
        return split(self, { (element: Character) -> Bool in
            return element == separator
        })
    }
    

//    func normalOutput() -> String {
//       return join(" ", self.explode("_").map{$0.capitalizedString})
//        
//    }
}

extension Array {
    func contains<T : Equatable>(obj: T) -> Bool {
        let filtered = self.filter {$0 as? T == obj}
        return filtered.count > 0
    }
    
    // re-arrange index from 123456 to 142356  or 123456789 to 147258369
    func shiftOrder(columns: Int) -> Array {
        
        if self.count % columns == 0 {
            var rows = self.count / columns
            var arr = Array()
     
            for var c = 0 ; c < columns ; c++ {
                for var r = 0; r < rows ; r++ {
                    arr.append(self[c + r * columns])
                }
            }
            return arr
            
        }else {
            return self
        }
        
    }
    
    // delete all the items in self that are equal to element
    mutating func remove <U: Equatable> (element: U) {
        let anotherSelf = self
        
        removeAll(keepCapacity: true)
        
        anotherSelf.each {
            (index: Int, current: Element) in
            if current as U != element {
                self.append(current)
            }
        }
    }
    
    //  Iterates on each element of the array with its index.
    func each (call: (Int, Element) -> ()) {
        
        for (index, item) in enumerate(self) {
            call(index, item)
        }
        
    }
}

class Array2D {
    var cols:Int, rows:Int
    var matrix:[Int]
    
    
    init(cols:Int, rows:Int) {
        self.cols = cols
        self.rows = rows
        matrix = Array(count:cols*rows, repeatedValue:0)
    }
    
    subscript(col:Int, row:Int) -> Int {
        get {
            return matrix[cols * row + col]
        }
        set {
            matrix[cols*row+col] = newValue
        }
    }
    
    func colCount() -> Int {
        return self.cols
    }
    
    func rowCount() -> Int {
        return self.rows
    }
}

//let str1 = "abc"  let str2 = "\u{20DD}def" at(str1+str2, 3)   // d   take(str1+str2, 2) // ab



