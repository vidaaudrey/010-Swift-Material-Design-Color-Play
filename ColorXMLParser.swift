//
//  ColorXMLParser.swift
//  010-Swift-Material-Design-Color-Kit
//
//  Created by Audrey Li on 3/27/15.
//  Copyright (c) 2015 UIColle. All rights reserved.
//
// get "<color name="md_pink_50">#FCE4EC</color>" to Color(name: pink, hex: FCE4EC, subNumber: P50)

import Foundation

class ColorXMLParser: NSObject, NSXMLParserDelegate {
    
    var colors: [MDColor]!
    var tempName = ""
    var tempSubNumber = ""
    
    init(url: NSURL) {
        super.init()
        colors = [MDColor]()
        var xmlParse = NSXMLParser(contentsOfURL: url)
        xmlParse?.delegate = self
        xmlParse?.parse()
    
    }
    
    func getColors() -> [MDColor]{
        return colors
    }
    
    func parser(parser: NSXMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject : AnyObject]!) {
        
        if let colorName = attributeDict["name"] as? String {
            var tempArray = colorName.componentsSeparatedByString("_")
            tempArray.removeAtIndex(0) //remove md_
            
            tempSubNumber = tempArray.removeLast()
            // add P in front of the color subNumber, so we can use P100 to ref it 
            if tempSubNumber[0] != "A" {
                tempSubNumber = "P" + tempSubNumber
            }

            let joinedString: String = join("_", tempArray)
            
            tempName = joinedString
            
            if tempName == "white" {
                tempSubNumber = "W" + tempSubNumber
            }
            
        }
        
    }
    

    func parser(parser: NSXMLParser!, foundCharacters string: String!) {
        
        if NSString(string: string).containsString("#"){
            colors.append(MDColor(name: tempName, hex: string.uppercaseString, subNumber: tempSubNumber))
        }
    }
    
    func parserDidEndDocument(parser: NSXMLParser!) {
        println("did finish parsing \(colors.count) \(colors[255].hex)")

    }

    
}