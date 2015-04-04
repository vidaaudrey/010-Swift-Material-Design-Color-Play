//
//  PaletteCollectionViewCell.swift
//  010-Swift-Material-Design-Color-Kit
//
//  Created by Audrey Li on 3/29/15.
//  Copyright (c) 2015 UIColle. All rights reserved.
//

import UIKit

class PaletteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var hexLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        var bgView = UIView(frame: self.bounds)
        self.backgroundView = bgView
        self.backgroundView?.backgroundColor = UIColor.blueColor()
        
    }
    
    
}
