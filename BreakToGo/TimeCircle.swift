//
//  TimeCircle.swift
//  BreakToGo
//
//  Created by Стас on 9/25/15.
//  Copyright © 2015 Younga. All rights reserved.
//

import Cocoa

class TimeCircle: NSView {

     var progressCircle = CAShapeLayer()
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
        
        let centerPoint = CGPoint (x: self.bounds.width / 2, y: self.bounds.width / 2)
        let circleRadius : CGFloat = self.bounds.width / 2 * 0.83
        
        let circlePath = NSBezierPath()
        circlePath.appendBezierPathWithArcWithCenter(centerPoint, radius: circleRadius, startAngle: CGFloat(90), endAngle: CGFloat(-270), clockwise: true)
        circlePath.closePath()
        
        progressCircle = CAShapeLayer ()
        progressCircle.path = circlePath.CGPath
        //progressCircle.strokeColor = NSColor.blueColor().CGColor
        progressCircle.strokeColor = NSColor(red: CGFloat(110.0/255.0), green: CGFloat(141.0/255.0), blue: CGFloat(224.0/255.0), alpha: CGFloat(1.0)).CGColor
        progressCircle.fillColor = NSColor.clearColor().CGColor
        progressCircle.lineWidth = 5
        progressCircle.strokeStart = 0.00
        progressCircle.strokeEnd = 0.00
        
        self.layer!.addSublayer(progressCircle)
        
        self.layerContentsRedrawPolicy = NSViewLayerContentsRedrawPolicy.OnSetNeedsDisplay
        
        //Simple animation
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = CGFloat(0.0)
        animation.toValue = CGFloat(1.0)
        animation.duration = 10.0
        animation.delegate = self
        animation.removedOnCompletion = false
        animation.additive = true
        animation.fillMode = kCAFillModeForwards
        //progressCircle.addAnimation(animation, forKey: "strokeEnd")
    }
    
}
