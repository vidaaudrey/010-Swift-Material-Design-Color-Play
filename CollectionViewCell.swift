//
//  CollectionViewCell.swift
//  CollectionViewSimple
//
//  Created by Audrey Li on 2/21/15.
//  Copyright (c) 2015 Shomigo. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var myLabel: UILabel!
    

    override func awakeFromNib() {
        var bgView = UIView(frame: self.bounds)
        self.backgroundView = bgView
        self.backgroundView?.backgroundColor = UIColor.blueColor()
        
        var selectedbgView = UIView(frame: self.bounds)
        self.selectedBackgroundView = selectedbgView
        self.selectedBackgroundView?.backgroundColor = UIColor.orangeColor()
    }
}
