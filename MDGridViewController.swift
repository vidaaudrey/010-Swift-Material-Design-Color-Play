//
//  MDListViewController.swift
//  010-Swift-Material-Design-Color-Kit
//
//  Created by Audrey Li on 3/29/15.
//  Copyright (c) 2015 UIColle. All rights reserved.
//

import UIKit

class MDGridViewController: UIViewController, UICollectionViewDelegate{
    
    @IBOutlet var colorsCollectionView: UICollectionView!
    @IBOutlet var colorsFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var paletteCollectionView: UICollectionView!
    @IBOutlet weak var paletteFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var button: UIButton!

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
 
                palette =  palette.shiftOrder(4)
                
                self.paletteCollectionView.reloadData()
                
            }
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorsCollectionView.allowsMultipleSelection = true
        

        
        var filePath = NSBundle.mainBundle().pathForResource("Colors", ofType: "xml")
        var url = NSURL(fileURLWithPath: filePath!)
        var parser = ColorXMLParser(url: url!)
        colors = parser.colors
        
        let myMDColor = MDColorsClass(colors:colors)
        palette = [MDColor]()
        selectedPath = [NSIndexPath]()
        selectedColors = [MDColor]()
        primaryColors = myMDColor.getPrimaryColorArray()
        
        
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showPreview" {
            
            let navi = segue.destinationViewController as UINavigationController
            println("outergoingto segue")
            if let dvc = (segue.destinationViewController as? UINavigationController)?.viewControllers[0] as? PreviewViewController {
                dvc.palette = Palette(colors: palette.shiftOrder(2))

            }
        
        } else if segue.identifier == "showList" {
            if let dvc = (segue.destinationViewController as? UINavigationController)?.viewControllers[0] as? MDListViewController {
                println("innger gong to segue")
                dvc.colors = colors
                dvc.primaryColors = primaryColors
                
            }
        }
        
    }
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == colorsCollectionView {
            return primaryColors.count
        } else {
            return palette.count
            
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if collectionView == colorsCollectionView {
           
         // can not use the dequeue!!!  let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CoCell", forIndexPath: indexPath) as ColorCollectionViewCell
            
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
       
        
    }
    
    func printSColors(selectedColors:[MDColor]) {
        println("Count:\(selectedColors.count)  ")
        for color in selectedColors {
            println("\(color.name)")
        }
    }
    
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        if collectionView == colorsCollectionView {
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
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if collectionView == colorsCollectionView {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CoCell", forIndexPath: indexPath) as ColorCollectionViewCell
            
            let color = primaryColors[indexPath.row]
            cell.cellView.backgroundColor = color.getColor()
            cell.colorNameLabel.text = "\(normalizedColorName(color.name)) "

            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PaletteCollectionViewCell", forIndexPath: indexPath) as PaletteCollectionViewCell
            let color = palette[indexPath.row]
            cell.contentView.backgroundColor = color.getColor()
            cell.colorNameLabel.text = "\(normalizedColorName(color.name)) "
            cell.hexLabel.text = "\(color.hex)"
            
            var textColor = UIColor.whiteColor()
            if ColorPaletteConfig.LightColorArray.contains(color.name) || color.hex == "#FFFFFF" {
               textColor = UIColor.blackColor()
            }
            
            cell.hexLabel.textColor = textColor
            cell.colorNameLabel.textColor = textColor
            
            return cell
            
        }
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.Default
    }
    
    func normalizedColorName(colorName: String) -> String {
        return join(" ", colorName.explode("_").map{$0.capitalizedString})
    }
 
    
}
