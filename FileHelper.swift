//
//  File.swift
//  010-Swift-Material-Design-Color-Kit
//
//  Created by Audrey Li on 3/27/15.
//  Copyright (c) 2015 UIColle. All rights reserved.
//

import Foundation

class FileHelper{
    
    class func exists (path: String) -> Bool {
        return NSFileManager().fileExistsAtPath(path)
    }
    
    class func read (path: String, encoding: NSStringEncoding = NSUTF8StringEncoding) -> String? {
        if FileHelper.exists(path) {
            
            return String(contentsOfFile:path, encoding: encoding, error: nil)!

        }
        
        return nil
    }
    
    class func write (path: String, content: String, encoding: NSStringEncoding = NSUTF8StringEncoding) -> Bool {
        return content.writeToFile(path, atomically: true, encoding: encoding, error: nil)
    }
}



//var file1 = NSBundle.mainBundle().pathForResource("colors", ofType: "txt")
//let read : String? = File.read(file1!)
//println(read)
//
//var file2 = NSBundle.mainBundle().pathForResource("Test", ofType: "txt")
//let write : Bool = File.write(file2!, content: "String to write")