//
//  TableViewCell.swift
//  010-Swift-Material-Design-Color-Kit
//
//  Created by Audrey Li on 3/29/15.
//  Copyright (c) 2015 UIColle. All rights reserved.
//

import UIKit

class PaletteTableViewCell: UITableViewCell {

    @IBOutlet weak var hexLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
