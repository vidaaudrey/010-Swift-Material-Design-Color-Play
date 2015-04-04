//
//  Config.swift
//  003-Dribble-Client
//
//  Created by Audrey Li on 3/14/15.
//  Copyright (c) 2015 Shomigo. All rights reserved.
//

import Foundation
import UIKit

struct Config {
    static let ACCESS_TOKEN = "01fc9f4f4195073f4f2a340df4bef928c9d5ad277fe8e27c47daa96bf75419a0"
    static let SHOT_URL = "https://api.dribbble.com/v1/shots"
    static let TEST_URL = "http://www.telize.com/geoip"
}


class Theme {
    
    class var fontName : String {
        return "Avenir-Book"
    }
    
    class var boldFontName : String {
        return "Avenir-Black"
    }
    
    class var semiBoldFontName : String {
        return "Avenir-Heavy"
    }
    
    class var lighterFontName : String {
        return "Avenir-Light"
    }
    
    class var darkColor : UIColor {
        return UIColor.blackColor()
    }
    
    class var lightColor : UIColor {
        return UIColor(white: 0.6, alpha: 1.0)
    }
}