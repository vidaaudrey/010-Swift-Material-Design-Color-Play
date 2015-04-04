//
//  MDListViewController.swift
//  010-Swift-Material-Design-Color-Kit
//
//  Created by Audrey Li on 3/29/15.
//  Copyright (c) 2015 UIColle. All rights reserved.
//

import UIKit

class MDListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet var colorsCollectionView: UICollectionView!
    @IBOutlet var colorsFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var paletteTableView: UITableView!
    
    @IBOutlet var colorTableView: UITableView!
    
    var colors = [MDColor]()
    var palette = [MDColor]()
    var primaryColors = [MDColor]()
    
    var selectedPath: [NSIndexPath]!
    var selectedColors: [MDColor]!{
        // animate out the extra colors if there are already 2 colors
        
        didSet {
            if selectedColors != nil {
                
                //now get the primary and accent color and update the palette
                let myMDColor = MDColorsClass(colors:colors)
                var primaryColorName = "blue"
                var accentColorName = "grey"
                
                if selectedColors.count == 1 {
                    primaryColorName = selectedColors[0].name
                    
                } else if selectedColors.count == 2 {
                    primaryColorName = selectedColors[0].name
                    accentColorName = selectedColors[1].name
                }
                
                palette = myMDColor.getPalette(primaryColor: primaryColorName, accentColor: accentColorName).getPaletteArray()
                if colorTableView != nil {
                    self.colorTableView.reloadData()
                }
                
            }
            
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        colorsCollectionView.allowsMultipleSelection = true
        
        paletteTableView.estimatedRowHeight = 44
        paletteTableView.rowHeight = UITableViewAutomaticDimension
        
        palette = [MDColor]()
        selectedColors = [MDColor]()
        selectedPath = [NSIndexPath]()
        
    }
    
    // below is for table view. It displays the color palette
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("TaCell") as PaletteTableViewCell
        
        let color = palette[indexPath.row]
        cell.contentView.backgroundColor = color.getColor()
        cell.nameLabel.text = "\(normalizedColorName(color.name)) "
        cell.hexLabel.text = "\(color.hex) "
        
        
        var textColor = UIColor.whiteColor()
        if ColorPaletteConfig.LightColorArray.contains(color.name) || color.hex == "#FFFFFF" {
            textColor = UIColor.blackColor()
        }
        
        cell.hexLabel.textColor = textColor
        cell.nameLabel.textColor = textColor
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return palette.count
    }
    
    

    
     // below is for collection view
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return primaryColors.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CoCell", forIndexPath: indexPath) as ColorCollectionViewCell
        
        let color = primaryColors[indexPath.row]
        cell.cellView?.backgroundColor = color.getColor()
        cell.colorNameLabel.text = "\(normalizedColorName(color.name)) "
        
        return cell

    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let color = primaryColors[indexPath.row]
        
        selectedColors.insert(color, atIndex: 0)
        selectedPath.insert(indexPath, atIndex: 0)
        
        let cell = colorsCollectionView.cellForItemAtIndexPath(indexPath) as ColorCollectionViewCell
        animateCellBasedOnSelection(cell, isGoingToBeSelected: true)
        
        printSColors(selectedColors)
        
        
        if selectedPath.count > 2 {
            
            for var i = 2 ; i < selectedPath.count ; i++ {
                let cellE = colorsCollectionView.cellForItemAtIndexPath(selectedPath[i]) as ColorCollectionViewCell
                colorsCollectionView.deselectItemAtIndexPath(selectedPath[i], animated: false)
                animateCellBasedOnSelection(cellE, isGoingToBeSelected: false)
                
            }
            
            selectedColors.removeRange(Range(start: 2, end: selectedColors.count))
            selectedPath.removeRange(Range(start: 2, end: selectedPath.count))
        }
        
        printSColors(selectedColors)

    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = colorsCollectionView.cellForItemAtIndexPath(indexPath) as ColorCollectionViewCell
        
        let color = primaryColors[indexPath.row]
        
        animateCellBasedOnSelection(cell, isGoingToBeSelected: false)
        
        cell.tickImageView.image = nil
        
        
        if !selectedPath.isEmpty {
            if selectedPath[0] == indexPath {
                selectedColors.removeAtIndex(0)
            } else {
                selectedColors.removeLast()
            }
        }
        printSColors(selectedColors)

    }
    
    func printSColors(selectedColors:[MDColor]) {
        println("Count:\(selectedColors.count)  ")
        for color in selectedColors {
            println("\(color.name)")
        }
    }
 

    func animateCellBasedOnSelection(cell:ColorCollectionViewCell, isGoingToBeSelected selected: Bool) {
        if selected {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                cell.cellView.frame = CGRectInset(cell.bounds, 5, 5)
            })
            cell.tickImageView.image = UIImage(named: "Tick")
        } else {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                cell.cellView.frame = cell.bounds
            })
            cell.tickImageView.image = nil
        }
    }
    

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.Default
    }
    
    func normalizedColorName(colorName: String) -> String {
       return join(" ", colorName.explode("_").map{$0.capitalizedString})
    }
    
   
}
