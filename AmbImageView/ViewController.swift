//
//  ViewController.swift
//  AmbImageView
//
//  Created by Ambrish on 26/07/16.
//  Copyright © 2016 Ambrish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController : UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellId", forIndexPath: indexPath)
        
        
        return cell
        
        
        
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        
            //let width = textSizeCount(self.titles[indexPath.item], font: UIFont(name: HelveticaNeueRegular, size: size15)!, bundingSize: CGSize(width: 10000 , height: 50)).width
            return CGSize(width: 100 , height: 100)
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        
        let cellFrameInSuperview: CGRect = collectionView.convertRect((cell?.frame)!, toView: collectionView.superview!)
        
        let  akImage : AKImageView = AKImageView()
        
        akImage.startFrame = cellFrameInSuperview
        akImage.enableZoom = true
        akImage.show()

    }
    
    
    
    
    
    
    
    
}
