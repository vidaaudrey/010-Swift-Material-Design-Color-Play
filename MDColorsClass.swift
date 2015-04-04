//
//  MDColorsClass.swift
//  010-Swift-Material-Design-Color-Kit
//
//  Created by Audrey Li on 3/28/15.
//  Copyright (c) 2015 UIColle. All rights reserved.
//

import Foundation


struct ColorPaletteConfig {
    static var PrimaryNumber = "P500"
    static var PrimaryDarkNumber = "P700"
    static var PrimaryLightNumber = "P100"
    static var AccentNumber = "A200"
    static var AccentLightNumber = "A100"
    static var AccentDarkNumber = "A400"
    static let LightColorArray = ["green", "light_green", "lime", "yellow", "amber", "orange", "grey"]
    static let DefaultPrimaryColorHex = "#000000"
    static let DefaultAccentColorHex = "#333333"

    static let DefaultTextIconColorHex = "#FFFFFF"
    static let DefaultTextIconColorHexInLightTheme = "#000000"
    static let DefaultPrimaryTextColorHex = "#212121"
    static let DefaultSecondaryTextColorHex = "#727272"
    static let DefaultDividerColorHex = "#B6B6B6"
}

// process the colors to correspounding format 
class MDColorsClass {
    var colors: [MDColor]!
    
    init(colors:[MDColor]) {
        self.colors = colors
    }

    
    // use primary color and accent color to create and return a palette
    func getPalette(#primaryColor: String, accentColor: String) -> Palette {
        
        let colorsDict  = getColorDictionary()
        var pColor = primaryColor
        var aColor = accentColor
    
        let colorNamesArr = getColorNames()
        if !colorNamesArr.contains(pColor) {
            pColor = "blue"
        }
        if !colorNamesArr.contains(aColor) {
            aColor = "grey"
        }

        
        let pSubNumber = ColorPaletteConfig.PrimaryNumber
        let pdSubNumber = ColorPaletteConfig.PrimaryDarkNumber
        let plSubNumber = ColorPaletteConfig.PrimaryLightNumber
        
        var aSubNumber = ColorPaletteConfig.AccentNumber
        var adSubNumber = ColorPaletteConfig.AccentDarkNumber
        var alSubNumber = ColorPaletteConfig.AccentLightNumber
        // grey brown, and blue_grey does not have accent Color SubNumber like A100, A200, A400, A700. Here I use the primary color number instead
        if aColor == "grey" || aColor == "blue_grey" || aColor == "brown" {
            aSubNumber = ColorPaletteConfig.PrimaryNumber
            adSubNumber = ColorPaletteConfig.PrimaryDarkNumber
            alSubNumber = ColorPaletteConfig.PrimaryLightNumber
        }
        
        
        let primaryColor = MDColor(name: "primary", hex: colorsDict[pColor]![pSubNumber]!, subNumber: pSubNumber)
        let primaryDarkColor = MDColor(name: "dark_primary", hex: colorsDict[pColor]![pdSubNumber]!, subNumber: pdSubNumber)
        let primaryLightColor = MDColor(name: "light_primary", hex: colorsDict[pColor]![plSubNumber]!, subNumber: plSubNumber)
        
        let accentColor = MDColor(name: "accent", hex: colorsDict[aColor]![aSubNumber]!, subNumber: aSubNumber)
        let accentDarkColor = MDColor(name: aColor, hex: colorsDict[aColor]![adSubNumber]!, subNumber: adSubNumber)
        let accentLightColor = MDColor(name: aColor, hex: colorsDict[aColor]![alSubNumber]!, subNumber: alSubNumber)
        
        let palette = Palette()
        palette.primaryColor = primaryColor
        palette.primaryDarkColor = primaryDarkColor
        palette.primaryLightColor = primaryLightColor
        palette.accentColor = accentColor
        palette.accentDarkColor = accentDarkColor
        palette.accentLightColor = accentLightColor
        
        if contains(ColorPaletteConfig.LightColorArray, pColor){
                palette.textIconColor = MDColor(name: "default_text_icon", hex: ColorPaletteConfig.DefaultTextIconColorHexInLightTheme)

        } else {
            palette.textIconColor = MDColor(name: "default_text_icon", hex: ColorPaletteConfig.DefaultTextIconColorHex)
        }
        
        return palette
    }
    
    
    //sample output: deep_orange_P400: #FF7043
    func getFlatColorDictionary() -> [String : String]{
        
        
        var flatDict = [String : String]()
        
        for var i = 0; i < colors.count ; i++ {
            
            let tempC = colors[i]
            
            let s1: String = tempC.name
            var innerDict = [String : MDColor]()
            
            while i < colors.count && (s1 == colors[i].name || colors[i].name == "black" || colors[i].name == "white"){
                let c = colors[i]
                let indexString = tempC.name + "_" + c.subNumber
                flatDict[indexString] = c.hex
                
                i++
            }
            
            i--
            
        }
        return flatDict
        
    }
    
    // get all the primary colors
    func getPrimaryColorArray() -> [MDColor] {
        
        var primaryArr = [MDColor]()
        
        for color in colors {
            if color.subNumber == "P500" {
                primaryArr.append(color)
            }
        }
        return primaryArr
        
    }
    
    func getColorByName(name: String) -> MDColor {
        return getSubColorArrayByName(name)[4]  //500 is the primary color, it's the index of 4
    }
    
    func getColorNames() -> [String] {
        
        return getColorDictionary().keys.array
    }
    
   
    
    func getSubColorArrayByName(name: String) -> [MDColor] {
        return getColorDictionaryWithSubArray()![name]!
     
    }
    
    func getColorDictionaryWithSubArray() -> [String: [MDColor]]?{
        
        var outerDict = [String: [MDColor]]()
        
        for var i = 0; i < colors.count ; i++ {
            
            let tempC = colors[i]
            let s1: String = tempC.name
            
            var innerArr = [MDColor]()
            
            while i < colors.count && (s1 == colors[i].name || colors[i].name == "black" || colors[i].name == "white"){
                innerArr.append(colors[i])
                i++
            }
            
            outerDict["\(tempC.name)"] = innerArr
            innerArr = [MDColor]()
            i--
        
        }
        
        return outerDict
    }
    
    func getColorNameByHex(hex: String) -> String {
        for color in colors {
            if color.hex.uppercaseString  == hex {
                return "\(color.name)_\(color.subNumber)"
            }
        }
        let str = "Hex Number is not included in Material Design"
        return str
    }
    
    func getColorDictionary() -> [String: [String: String]] {
    
        var outerDict = [String: [String : String]]()
    
        for var i = 0; i < colors.count ; i++ {
        
            let tempC = colors[i]
            let s1: String = tempC.name
            var innerDict = [String : String]()
                
            while i < colors.count && (s1 == colors[i].name || colors[i].name == "black" || colors[i].name == "white"){
                let c = colors[i]
                innerDict["\(c.subNumber)"] = c.hex
                i++
            }
        
            outerDict["\(tempC.name)"] = innerDict
            innerDict = [String: String]()
            i--
        
        }
        return outerDict
      
    }
    
    
    func printColorStruct () {
       
        println("import Foundation")
        println("struct MDColors {")
        
        for var i = 0; i < colors.count ; i++ {
            println("   struct \(colors[i].name)" + " {")
            
            let tempC = colors[i]
            
            let s1: String = tempC.name
            
            while i < colors.count && (s1 == colors[i].name || colors[i].name == "black" || colors[i].name == "white"){
                
                let c = colors[i]
                println( "      static let \(c.subNumber)  = Color(hex: " + "\"" + "\(c.hex)" +  "\"" + ")")
                
                i++
                
            }
            
            i--
            
            println("   }")
            
        }
        println("}")
        
    }

}
