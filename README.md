# 008-Building-A-Clock-Control-Framework

![Snapshot 1](https://github.com/vidaaudrey/010-Swift-Material-Design-Color-Play/blob/master/_snapshot/snapshot.gif)

![Snapshot 2](https://github.com/vidaaudrey/010-Swift-Material-Design-Color-Play/blob/master/_snapshot/snapshot.png)


**Description**: A simple material design color palette which shows the palette colors upon selection. 


**How to use**:
* Static way to use material colors: add MDColors.swift to the folder and use below code: view.backgroundColor =  MDColors.red.A200  
* Dynamic way to use material colors: use MDColorsClass to process the colors, create color array or dictionary,  and generate palette. For the details of how to generate colors and palette, ref MDGridViewController

**Dodo**:
* Write a datasource class to allow multiple ViewControllers to share the same data 
* Fix bug with multiple selection in ColorCollectionView