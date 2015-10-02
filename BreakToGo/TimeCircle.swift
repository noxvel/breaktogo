//
//  TimeCircle.swift
//  BreakToGo
//
//  Created by Стас on 9/25/15.
//  Copyright © 2015 Younga. All rights reserved.
//

import Cocoa

class TimeCircle: NSView {
    
    let backgroundCircle = CALayer()
    var progressCircle = CAShapeLayer()
    var progressStamp = CAShapeLayer()
    
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
        let backgroundImage: NSImage = NSImage(named: "timer_circle")!
        let circleWidth : CGFloat = 5
        
        backgroundCircle.contents = backgroundImage
        backgroundCircle.frame = CGRect(x: self.bounds.width / 2 - backgroundImage.size.width / 2, y: self.bounds.width / 2 - backgroundImage.size.width / 2, width: backgroundImage.size.width, height: backgroundImage.size.height)
        backgroundCircle.contentsGravity = kCAGravityResizeAspect
        
        //pinLayer.borderColor = NSColor.redColor().CGColor
        //pinLayer.borderWidth = 2.0
        self.layer!.addSublayer(backgroundCircle)
        
        
        let centerPoint = CGPoint (x: self.bounds.width / 2, y: self.bounds.width / 2)
        let circleRadius : CGFloat = (backgroundImage.size.width / 2) - (circleWidth / 2)
        let circlePath = NSBezierPath()
        circlePath.appendBezierPathWithArcWithCenter(centerPoint, radius: circleRadius, startAngle: CGFloat(90), endAngle: CGFloat(-270), clockwise: true)
        circlePath.closePath()
        
        //progressCircle = CAShapeLayer ()
        progressCircle.path = circlePath.CGPath
        //progressCircle.strokeColor = NSColor.blueColor().CGColor
        progressCircle.strokeColor = NSColor(red: CGFloat(110.0/255.0), green: CGFloat(141.0/255.0), blue: CGFloat(224.0/255.0), alpha: CGFloat(1.0)).CGColor
        progressCircle.fillColor = NSColor.clearColor().CGColor
        progressCircle.lineWidth = circleWidth
        progressCircle.strokeStart = 0.00
        progressCircle.strokeEnd = 0.00
        
        self.layer!.addSublayer(progressCircle)
        //self.layer!.insertSublayer(backgroundCircle, below: progressCircle)
    
        
        //circle line point
        let circleStampRadius : CGFloat = (backgroundImage.size.width / 2) - ((circleWidth * 6) / 2)
        let circleStampPath = NSBezierPath()
        circleStampPath.appendBezierPathWithArcWithCenter(centerPoint, radius: circleStampRadius, startAngle: CGFloat(90), endAngle: CGFloat(-270), clockwise: true)
        circleStampPath.closePath()
        
        
        progressStamp.path = circleStampPath.CGPath
        //progressStamp.strokeColor = NSColor.blueColor().CGColor
        progressStamp.strokeColor = NSColor(red: CGFloat(110.0/255.0), green: CGFloat(141.0/255.0), blue: CGFloat(224.0/255.0), alpha: CGFloat(1.0)).CGColor
        progressStamp.fillColor = NSColor.clearColor().CGColor
        progressStamp.lineWidth = circleWidth * 6
        progressStamp.strokeStart = 0.00
        progressStamp.strokeEnd = 0.002
        
        self.layer!.addSublayer(progressStamp)
        
        
        self.layerContentsRedrawPolicy = NSViewLayerContentsRedrawPolicy.OnSetNeedsDisplay
        
        //Simple animation
        /*
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = CGFloat(0.0)
        animation.toValue = CGFloat(1.0)
        animation.duration = 10.0
        animation.delegate = self
        animation.removedOnCompletion = false
        animation.additive = true
        animation.fillMode = kCAFillModeForwards
        progressCircle.addAnimation(animation, forKey: "strokeEnd")
        */
    }
    
}
