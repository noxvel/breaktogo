//
//  GeneralProgressView.swift
//  BreakToGo
//
//  Created by Стас on 9/25/15.
//  Copyright © 2015 Younga. All rights reserved.
//

import Cocoa

class GeneralProgressView: NSView {
    
    let progressLine = CAShapeLayer()
    let progressLineEmpty = CAShapeLayer ()
    let pinLayer = CALayer()
    var xProgressBar: CGFloat = 0.0
    var xProgressBarBegin: CGFloat = 0.0
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
        
        
        let pinImage = NSImage(named: "progress-bar-start-fill.png")
 
            
        //let centerPoint = CGPoint (x: self.bounds.width / 2, y: self.bounds.width / 2)
        //let circleRadius : CGFloat = self.bounds.width / 2 * 0.83
        
        self.xProgressBar = self.bounds.width - pinImage!.size.width
        self.xProgressBarBegin = pinImage!.size.width / 2
        
      
        let linePath = NSBezierPath()
        
        
        linePath.moveToPoint(CGPoint(x: pinImage!.size.width / 2, y: self.bounds.height / 3))
        linePath.lineToPoint(CGPoint(x: self.bounds.width - pinImage!.size.width / 2, y: self.bounds.height / 3))
        //linePath.lineCapStyle = NSLineCapStyle.RoundLineCapStyle


        progressLineEmpty.path = linePath.CGPath
        //progressLineEmpty.strokeColor = NSColor.blueColor().CGColor
        progressLineEmpty.strokeColor = NSColor(red: CGFloat(232.0/255.0), green: CGFloat(230.0/255.0), blue: CGFloat(231.0/255.0), alpha: CGFloat(1.0)).CGColor
        //progressLineEmpty.fillColor = NSColor.redColor().CGColor
        progressLineEmpty.lineCap = kCALineCapRound
        progressLineEmpty.lineWidth = pinImage!.size.width
        progressLineEmpty.strokeStart = 0.00
        progressLineEmpty.strokeEnd = 1.00
        
        self.layer!.addSublayer(progressLineEmpty)
        
        
        progressLine.path = linePath.CGPath
        //progressLine.strokeColor = NSColor.blueColor().CGColor
        progressLine.strokeColor = NSColor(red: CGFloat(200.0/255.0), green: CGFloat(207.0/255.0), blue: CGFloat(83.0/255.0), alpha: CGFloat(1.0)).CGColor
        //progressLine.fillColor = NSColor.redColor().CGColor
        progressLine.lineCap = kCALineCapRound
        progressLine.lineWidth = pinImage!.size.width
        progressLine.strokeStart = 0.00
        progressLine.strokeEnd = 0.00
        
        self.layer!.addSublayer(progressLine)
        
        
        
        pinLayer.contents = pinImage
        pinLayer.frame = CGRect(x: 0, y: self.bounds.height / 3 - pinImage!.size.width / 2, width: pinImage!.size.width, height: pinImage!.size.height)
        pinLayer.contentsGravity = kCAGravityResizeAspect
        //pinLayer.borderColor = NSColor.redColor().CGColor
        //pinLayer.borderWidth = 2.0
        self.layer!.addSublayer(pinLayer)
   
        self.layerContentsRedrawPolicy = NSViewLayerContentsRedrawPolicy.OnSetNeedsDisplay
        
        /* Animations */
        /*
        //Animation for pin
        let pinAnimation = CAKeyframeAnimation(keyPath: "position")
        pinAnimation.path = linePath.CGPath
        pinAnimation.duration = 5.0
        pinLayer.addAnimation(pinAnimation, forKey: "position")
        
        //Simple animation
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = CGFloat(0.0)
        animation.toValue = CGFloat(1.0)
        animation.duration = 5.0
        animation.delegate = self
        animation.removedOnCompletion = false
        animation.additive = true
        animation.fillMode = kCAFillModeForwards
        progressLine.addAnimation(animation, forKey: "strokeEnd")
        */

    }
    
}
