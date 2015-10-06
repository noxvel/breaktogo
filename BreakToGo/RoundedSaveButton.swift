//
//  RoundedSaveButton.swift
//  BreakToGo
//
//  Created by Стас on 10/6/15.
//  Copyright © 2015 Younga. All rights reserved.
//

import Cocoa

class RoundedSaveButton: NSButton {

    override var highlighted:Bool {
        
        didSet {
            super.highlighted = highlighted
            setNeedsDisplay()
        }
    }
    
    
    override func drawRect(dirtyRect: NSRect) {
        
        self.setButtonType(NSButtonType.MomentaryPushInButton)
        
        NSGraphicsContext.saveGraphicsState()
        
        let cornerRadius : CGFloat = 9
        
        let path : NSBezierPath = NSBezierPath()
        path.moveToPoint(NSPoint(x: NSMinX(self.bounds), y: NSMaxY(self.bounds)))
        
        // Draw side border and a top-left rounded corner
        let topLeftCorner = NSPoint(x: NSMinX(self.bounds), y: NSMinY(self.bounds))
        path.lineToPoint(NSPoint(x: NSMinX(self.bounds), y: NSMinY(self.bounds)+cornerRadius))
        path.curveToPoint(NSPoint(x: NSMinX(self.bounds) + cornerRadius, y: NSMinY(self.bounds)), controlPoint1: topLeftCorner, controlPoint2: topLeftCorner)
        
        // Draw top border and a top-right rounded corner
        let topRightCorner = NSPoint(x: NSMaxX(self.bounds), y: NSMinY(self.bounds))
        path.lineToPoint(NSPoint(x: NSMaxX(self.bounds)-cornerRadius, y: NSMinY(self.bounds)))
        path.curveToPoint(NSPoint(x: NSMaxX(self.bounds), y: NSMinY(self.bounds)+cornerRadius), controlPoint1: topRightCorner, controlPoint2: topRightCorner)
        
        // Draw bottom border and a bottom-right rounded corner
        let bottomRightCorner = NSPoint(x: NSMaxX(self.bounds), y: NSMaxY(self.bounds))
        path.lineToPoint(NSPoint(x: NSMaxX(self.bounds), y: NSMaxY(self.bounds)-cornerRadius))
        path.curveToPoint(NSPoint(x: NSMaxX(self.bounds)-cornerRadius, y: NSMaxY(self.bounds)), controlPoint1: bottomRightCorner, controlPoint2: bottomRightCorner)
        
        // Draw left border and a bottom-left rounded corner
        let bottomLeftCorner = NSPoint(x: NSMinX(self.bounds), y: NSMaxY(self.bounds))
        path.lineToPoint(NSPoint(x: NSMinX(self.bounds)+cornerRadius, y: NSMaxY(self.bounds)))
        path.curveToPoint(NSPoint(x: NSMinX(self.bounds), y: NSMaxY(self.bounds)-cornerRadius), controlPoint1: bottomLeftCorner, controlPoint2: bottomLeftCorner)
        
        var backColor : NSColor?
        
        if (self.enabled){
            backColor = NSColor(red: CGFloat(110.0/255.0), green: CGFloat(141.0/255.0), blue: CGFloat(224.0/255.0), alpha: CGFloat(1.0))
        }
        else{
            backColor = NSColor.darkGrayColor()
        }
        
        backColor!.setFill()
        path.fill()
        
        
        let pstyle = NSMutableParagraphStyle()
        let font = NSFont(name: "Helvetica", size: 16)
        pstyle.alignment = NSCenterTextAlignment
        
        self.attributedTitle = NSAttributedString(string: "Save Changes", attributes: [ NSForegroundColorAttributeName : NSColor.whiteColor(), NSParagraphStyleAttributeName : pstyle , NSFontAttributeName :  font! ])
        
        NSGraphicsContext.restoreGraphicsState()
        
        super.drawRect(dirtyRect)
        
    }
}
