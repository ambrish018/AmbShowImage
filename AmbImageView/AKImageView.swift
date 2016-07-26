//
//  ImageView.swift
//  AmbImageView

//
//  Created by Ambrish on 26/07/16.
//  Copyright © 2016 Ambrish. All rights reserved.//

import UIKit

let kImageHeight : CGFloat = 400
var APPDELEGATEOBJECT : AppDelegate {
return UIApplication.sharedApplication().delegate as! AppDelegate
}
class AKImageView: UIView, UIScrollViewDelegate {
    
    var image : UIImage!
    var imageURL: String?
    var startFrame :CGRect?
    var imageView : UIImageView!
    
    var backgroundView : UIView!
    var scrollView : UIScrollView!
    var hideButton : UIButton!
    var editButton : UIButton!
    
    var enableZoom : Bool?
    
    required override init(frame: CGRect) {
        super.init(frame : UIScreen.mainScreen().bounds)
        
        self.backgroundColor = UIColor.clearColor()
        self.backgroundView = UIView(frame : UIScreen.mainScreen().bounds)
        self.backgroundView.backgroundColor = UIColor.blackColor()
        self.backgroundView.alpha = 0
        
        self.scrollView = UIScrollView(frame:self.backgroundView.bounds)
        self.scrollView.backgroundColor = UIColor.clearColor()
        
        self.imageView = UIImageView()
        self.imageView.backgroundColor = UIColor.clearColor()
        self.imageView.clipsToBounds = true
        self.imageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        self.hideButton = UIButton(type: UIButtonType.Custom)
        self.hideButton.backgroundColor = UIColor.clearColor()
        self.hideButton.tintColor = UIColor.whiteColor()
        
        self.hideButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
        self.hideButton.setTitle(" Close ", forState: UIControlState.Normal)
        self.hideButton.setTitleColor(UIColor(red: 247/255.0, green: 102/255.0, blue: 13/255.0, alpha: 1), forState: UIControlState.Normal)
        self.hideButton.titleLabel?.adjustsFontSizeToFitWidth=true
        self.hideButton.addTarget(self, action: "doneButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        self.hideButton.frame = CGRectMake(UIScreen.mainScreen().bounds.size.width-80, 20, 70, 30)
//        self.hideButton.layer.borderWidth = 1
//        self.hideButton.layer.borderColor = UIColor(red: 134/255.0, green: 163/255.0, blue: 47/255.0, alpha: 1).CGColor
//        self.hideButton.layer.cornerRadius = 5
//        self.hideButton.layer.masksToBounds = true
        
        self.editButton = UIButton(type: UIButtonType.Custom)
        self.editButton.backgroundColor = UIColor.clearColor()
        self.editButton.tintColor = UIColor.whiteColor()
        
        self.editButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
        self.editButton.setTitle(" Edit ", forState: UIControlState.Normal)
        self.editButton.setTitleColor(UIColor(red: 247/255.0, green: 102/255.0, blue: 13/255.0, alpha: 1), forState: UIControlState.Normal)
        self.editButton.titleLabel?.adjustsFontSizeToFitWidth=true
//        self.editButton.addTarget(self, action: "doneButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        self.editButton.frame = CGRectMake(10, 20, 70, 30)
//        self.editButton.layer.borderWidth = 1
//        self.editButton.layer.borderColor = UIColor(red: 134/255.0, green: 163/255.0, blue: 47/255.0, alpha: 1).CGColor
//        self.editButton.layer.cornerRadius = 5
//        self.editButton.layer.masksToBounds = true
        
        self.addSubview(self.backgroundView)
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.imageView)
        self.addSubview(self.hideButton)
        self.addSubview(self.editButton)
        
        self.userInteractionEnabled = true
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show() {
        
        let window : UIWindow = APPDELEGATEOBJECT.window!
        window.addSubview(self)
        
        self.imageView.image = self.image
        /*
        if let url = imageURL where url != "" {
            self.imageView.sd_setImageWithURL(NSURL(string: url)!, placeholderImage: self.image)
        }
 */
        self.imageView.image = UIImage(named: "DemoImage.jpg")
        self.imageView.frame = self.startFrame!
        
        var frame : CGRect = CGRectZero
        frame.size.width = UIScreen.mainScreen().bounds.size.width
        frame.size.height = kImageHeight
        frame.origin.y = (UIScreen.mainScreen().bounds.size.height - kImageHeight)/2 
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            
            self.backgroundView.alpha = 1
            self.imageView.frame = frame
            
            }) { (finished) -> Void in
                UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: UIStatusBarAnimation.Fade)
        }
        
        if enableZoom == true {
            self.scrollView.delegate = self
        }
        self.scrollView.contentSize = CGSizeMake(self.imageView.frame.size.width, self.imageView.frame.size.height)
        self.scrollView.minimumZoomScale = 1.0 
        self.scrollView.maximumZoomScale = 5.0 
    }
    
    func hide() {
        
        self.hideButton.alpha = 0
        self.editButton.alpha = 0
        
        UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: UIStatusBarAnimation.None)
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            
            self.imageView.frame = self.startFrame!
            self.backgroundView.alpha = 0
            self.imageView.alpha = 0
            
            }) { (finished) -> Void in
                self.removeFromSuperview()
        }
    }
    
    func doneButtonTapped(btn : UIButton)
    {
        self.hide()
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
    {
        return self.imageView
    }
    
}
