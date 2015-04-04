//
//  PreviewTableViewCell.swift
//  010-Swift-Material-Design-Color-Kit
//
//  Created by Audrey Li on 4/3/15.
//  Copyright (c) 2015 UIColle. All rights reserved.
//

import UIKit

class PreviewTableViewCell: UITableViewCell {

    
    @IBOutlet weak var previewButtonIcon: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
