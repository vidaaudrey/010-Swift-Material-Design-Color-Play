//
//  Palette.swift
//  010-Swift-Material-Design-Color-Kit
//
//  Created by Audrey Li on 3/28/15.
//  Copyright (c) 2015 UIColle. All rights reserved.
//

import Foundation

// update later, change to struct 

class Palette {
    var primaryDarkColor: MDColor!
    var primaryColor: MDColor!
    var primaryLightColor: MDColor!
    var textIconColor: MDColor!
    var accentColor: MDColor!
    var primaryTextColor: MDColor!
    var secondaryTextColor: MDColor!
    var dividerColor: MDColor!
    
    
    //fallback accentColor
    var accentLightColor: MDColor!
    var accentDarkColor: MDColor!
    
    init(){
        self.primaryColor = MDColor(name: "default_primary", hex: ColorPaletteConfig.DefaultPrimaryColorHex)
        self.accentColor = MDColor(name: "default_accent", hex: ColorPaletteConfig.DefaultAccentColorHex)
        
        self.textIconColor = MDColor(name: "default_text_icon", hex: ColorPaletteConfig.DefaultTextIconColorHex)
        self.primaryTextColor = MDColor(name: "default_primary_text", hex: ColorPaletteConfig.DefaultPrimaryTextColorHex)
        self.secondaryTextColor = MDColor(name: "default_secondary_text", hex: ColorPaletteConfig.DefaultSecondaryTextColorHex)
        self.dividerColor = MDColor(name: "default_devider", hex: ColorPaletteConfig.DefaultDividerColorHex)
    }
    
    init(colors: [MDColor]){
        if colors.count == 8 {
            self.primaryColor = colors[1]
            self.primaryDarkColor = colors[0]
            self.primaryLightColor = colors[2]
            self.textIconColor = colors[3]
            self.accentColor = colors[4]
            self.primaryTextColor = colors[5]
            self.secondaryTextColor = colors[6]
            self.dividerColor = colors[7]
        }
    }
    
    func getPaletteArray() -> [MDColor] {
        var arr = [MDColor]()
        arr.append(self.primaryDarkColor)
        arr.append(self.primaryColor)
        arr.append(self.primaryLightColor)
        arr.append(self.textIconColor)
        arr.append(self.accentColor)
        arr.append(self.primaryTextColor)
        arr.append(self.secondaryTextColor)
        arr.append(self.dividerColor)
        return arr
    }
    

    func getPaletteDictionary() -> [String: String?] {
        return ["primaryDarkColor": primaryDarkColor.hex,
                "primaryColor": primaryColor.hex,
                "primaryLightColor": primaryLightColor.hex,
                "textIconColor": textIconColor.hex,
                "accentColor": accentColor.hex,
                "primaryTextColor": primaryTextColor.hex,
                "secondaryTextColor": secondaryTextColor.hex,
                "dividerColor": dividerColor.hex,
                "accentLightColor": accentLightColor.hex,
                "accentDarkColor" : accentDarkColor.hex
        ]
    }
    
}