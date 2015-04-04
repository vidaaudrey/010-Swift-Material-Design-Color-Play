//
//  PreviewViewController.swift
//  010-Swift-Material-Design-Color-Kit
//
//  Created by Audrey Li on 4/3/15.
//  Copyright (c) 2015 UIColle. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var previewTitles = ["Visit Home", "Go to France", "Go to Austria", "Visit Rio", "South Pole" ]
    var previewSubTitles = ["August 3, 2013", "Septempber 3, 2016", "January 1, 2019", "July 2, 2018", "April, 2018"]
    var previewImageSymbols = ["✓", "❍", "⚑", "☂",  "✭", "➜"]
    
    @IBOutlet weak var starButtonView: StarIconView!
    @IBOutlet weak var topView: UIView!
    
    var palette: Palette = Palette()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var layer = topView.layer
        layer.shadowColor = UIColor.grayColor().CGColor
        layer.shadowOffset = CGSizeMake(0, 3)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 2.0
        
        topView.backgroundColor = Color(hex: palette.primaryColor.hex)
        starButtonView.circleColar = Color(hex: palette.accentColor.hex)

        
    }
    

 
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("previewCell") as PreviewTableViewCell
        
        cell.titleLabel.text = previewTitles[indexPath.row]
        cell.subTitleLabel.text = previewSubTitles[indexPath.row]
        cell.previewButtonIcon.setTitle(previewImageSymbols[indexPath.row], forState: UIControlState.Normal)
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return previewTitles.count
    }
   

}
