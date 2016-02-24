//
//  CategoryRow.swift
//  EventApp
//
//  Created by Luisa Paiva on 2/23/16.
//  Copyright © 2016 Matheus Campioli. All rights reserved.
//

import UIKit

class CategoryRow: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    var arr: [String] = []
    
    var name : AnyObject? {
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey("name")
        }
        set {
            NSUserDefaults.standardUserDefaults().setObject(newValue!, forKey: "name")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let itemsPerRow:CGFloat = 2
        let hardCodedPadding:CGFloat = 4
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("videoCell", forIndexPath: indexPath) as! myViewCollectionViewCell
        
        
        cell.imgView.image = UIImage(named: arr[indexPath.row])
        cell.imgView.contentMode = UIViewContentMode.ScaleToFill
        cell.imgView.frame.size = cell.frame.size
        
        return cell
    }

    
    func collectionview(collectionView: UICollectionView!, didSelectItemAtIndezPath indexPath: NSIndexPath!) {
        name = arr[indexPath.row]
    }
    

    
}



