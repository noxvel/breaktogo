//
//  CrossfadeStoryboardSegue.swift
//  BreakToGo
//
//  Created by Стас on 9/29/15.
//  Copyright © 2015 Younga. All rights reserved.
//

import Cocoa

class CrossfadeStoryboardSegue: NSStoryboardSegue {
    
    override init(identifier: String?,
        source sourceController: AnyObject,
        destination destinationController: AnyObject) {
            var myIdentifier : String
            if identifier == nil {
                myIdentifier = ""
            } else {
                myIdentifier = identifier!
            }
            super.init(identifier: myIdentifier, source: sourceController, destination: destinationController)
    }
    
    override func perform() {
        let sourceViewController = self.sourceController as! NSViewController
        let destinationViewController = self.destinationController as! NSViewController
        let containerViewController = sourceViewController.parentViewController!
        

        print(sourceViewController.className)
        
        containerViewController.insertChildViewController(destinationViewController, atIndex: 1)
        
        let targetSize = destinationViewController.view.frame.size
        //var targetWidth = destinationViewController.view.frame.size.width
        //var targetHeight = destinationViewController.view.frame.size.height
        
        sourceViewController.view.wantsLayer = true
        destinationViewController.view.wantsLayer = true
        
        //Change direction of slide
        if(sourceViewController.className == "BreakToGo.TimerViewController"){
            containerViewController.transitionFromViewController(sourceViewController, toViewController: destinationViewController,
                options: NSViewControllerTransitionOptions.SlideRight, completionHandler: nil)
        }else{
        containerViewController.transitionFromViewController(sourceViewController, toViewController: destinationViewController,
            options: NSViewControllerTransitionOptions.SlideLeft, completionHandler: nil)
        }
        
        
        sourceViewController.view.animator().setFrameSize(targetSize)
        destinationViewController.view.animator().setFrameSize(targetSize)
        
        /*var currentFrame = containerViewController.view.window?.frame
        var currentRect = NSRectToCGRect(currentFrame!)
        
        var horizontalChange = (targetWidth - containerViewController.view.frame.size.width)/2
        var verticalChange = (targetHeight - containerViewController.view.frame.size.height)/2
        var newWindowRect = NSMakeRect(currentRect.origin.x - horizontalChange,
            currentRect.origin.y - verticalChange, targetWidth, targetHeight)
        containerViewController.view.window?.setFrame(newWindowRect, display: true, animate: true)*/
        
        containerViewController.removeChildViewControllerAtIndex(0)
    }

}
