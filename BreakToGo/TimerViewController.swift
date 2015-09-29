//
//  TimerViewController.swift
//  BreakToGo
//
//  Created by Стас on 9/14/15.
//  Copyright © 2015 Younga. All rights reserved.
//

import Cocoa
import QuartzCore
import AppKit

class TimerViewController: NSViewController {


    @IBOutlet weak var timerLabel: NSTextField!
    @IBOutlet weak var circle: TimeCircle!
    @IBOutlet weak var startButtonOutlet: NSButton!
    @IBOutlet weak var progressLine: GeneralProgressView!
    @IBOutlet weak var genProgressPercent: NSTextField!
    @IBOutlet weak var workOrBreakLabel: NSTextField!
    @IBOutlet weak var currentAmountOfRepeats: NSTextField!
    @IBOutlet weak var allAmountOfRepeats: NSTextField!
    
    
    
    var timer: NSTimer?
    var dataForTimer = TimerData()
    
    var devideCircle: Float = 0.0
    var devideAllTime: Double = 0.0
    var timerLabelText = 1.0
    var genProgressPercentText: Double = 0.0
    var genProgressPercentBar: CGFloat = 0.0
    var amountOfRepeats:Int = 1
    
    var workOrBreak = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        //self.circle = NSView(frame: CGRectMake(0,0, 300, 100))
    
        //self.circle.drawRect(NSRect())
        //circleSub.wantsLayer = true
        
        
        //self.circle.drawRect(NSRect())
        //self.progressLine.drawRect(NSRect())
        
        //self.view.addSubview(circleSub)
        
        devideCircle = 1.0 / Float(dataForTimer.workTime)
        devideAllTime = 1.0 / dataForTimer.allTime
        allAmountOfRepeats.stringValue = "/" + String(dataForTimer.workRepeats)
        
        
  
    }
    
    
    let playWorkImage = NSImage(named:"play_work_normal.png")
    let pauseWorkImage =  NSImage(named:"pause_work_normal.png")
    let playBreakImage = NSImage(named: "play_break_normal.png")
    let pauseBreakImage = NSImage(named: "pause_break_normal.png")
    
    
    
    
    @IBAction func playTimer(sender: AnyObject) {

        //let devideCircle: Double = 1.0/dataForTimer.workTime
        genProgressPercentBar = progressLine.xProgressBar / CGFloat(dataForTimer.allTime)
        currentAmountOfRepeats.stringValue = String(amountOfRepeats)
        
        if(workOrBreak){
            if self.startButtonOutlet.image?.name() == "pause_work_normal"{
                self.startButtonOutlet.image = playWorkImage
                timer?.invalidate()
                timer = nil
            }else if self.startButtonOutlet.image?.name() == "play_work_normal"{
                self.startButtonOutlet.image = pauseWorkImage
                if timer == nil{
                    timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "update", userInfo: nil, repeats: true)
                }
            }
        }else{
            if self.startButtonOutlet.image?.name() == "pause_break_normal"{
                self.startButtonOutlet.image = playBreakImage
                timer?.invalidate()
                timer = nil
            }else if self.startButtonOutlet.image?.name() == "play_break_normal"{
                self.startButtonOutlet.image = pauseBreakImage
                if timer == nil{
                    timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "update", userInfo: nil, repeats: true)
                }
            }
        }
        
        //print(self.startButtonOutlet.image?.description)
        
    }
    
    
    @IBAction func discardTimer(sender: AnyObject) {
        timer?.invalidate()
        timer = nil
        timerLabelText = 1.0
        genProgressPercentText = 0.0
        genProgressPercentBar = 0.0
        progressLine.progressLine.strokeEnd = 0.0
        circle.progressCircle.strokeEnd = 0.0
        amountOfRepeats = 1
        progressLine.pinLayer.position.x = progressLine.xProgressBarBegin
        self.timerLabel.stringValue = "00:00"
        self.genProgressPercent.stringValue = String(format: "%d%%", Int(ceil(genProgressPercentText * 100)))
        self.startButtonOutlet.image = playWorkImage
        currentAmountOfRepeats.stringValue = String(amountOfRepeats - 1)
    }
    
    func update(){
        if circle.progressCircle.strokeEnd >= 1.0 {
            timer?.invalidate()
            timer = nil
            
            if amountOfRepeats >= dataForTimer.workRepeats{
                return
            }
            
            if(workOrBreak){
                workOrBreak = false
                self.startButtonOutlet.image = pauseBreakImage
                timerLabelText = 1.0
                circle.progressCircle.strokeEnd = 0.0
                circle.progressCircle.strokeColor = NSColor(red: CGFloat(186.0/255.0), green: CGFloat(201.0/255.0), blue: CGFloat(55.0/255.0), alpha: CGFloat(1.0)).CGColor
                self.timerLabel.textColor = NSColor(red: CGFloat(186.0/255.0), green: CGFloat(201.0/255.0), blue: CGFloat(55.0/255.0), alpha: CGFloat(1.0))
                self.timerLabel.stringValue = "00:00"
                self.workOrBreakLabel.stringValue = "Break Time"
                
                devideCircle = 1.0 / Float(dataForTimer.shortBreak)
            }else{
                workOrBreak = true
                self.startButtonOutlet.image = pauseWorkImage
                timerLabelText = 1.0
                circle.progressCircle.strokeEnd = 0.0
                circle.progressCircle.strokeColor = NSColor(red: CGFloat(110.0/255.0), green: CGFloat(141.0/255.0), blue: CGFloat(224.0/255.0), alpha: CGFloat(1.0)).CGColor
                self.timerLabel.textColor = NSColor(red: CGFloat(110.0/255.0), green: CGFloat(141.0/255.0), blue: CGFloat(224.0/255.0), alpha: CGFloat(1.0))
                self.timerLabel.stringValue = "00:00"
                self.workOrBreakLabel.stringValue = "Work Time"
                
                devideCircle = 1.0 / Float(dataForTimer.workTime)
                currentAmountOfRepeats.stringValue = String(++amountOfRepeats)
            }
            
            if timer == nil{
                timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "update", userInfo: nil, repeats: true)
            }
        }
        else{
            //print(devideCircle)
            
            //circle.progressCircle.strokeEnd += CGFloat((timer?.userInfo)! as! NSNumber)
            
            circle.progressCircle.strokeEnd += CGFloat(devideCircle)
            progressLine.progressLine.strokeEnd += CGFloat(devideAllTime)
            progressLine.pinLayer.position.x += CGFloat(genProgressPercentBar)
            
            genProgressPercentText += devideAllTime
            self.timerLabel.stringValue = stringFromTimeInterval(timerLabelText++) as String
            self.genProgressPercent.stringValue = String(format: "%d%%", Int(floor(genProgressPercentText * 100)))
        
        }
        
    }
    
    func stringFromTimeInterval(interval:NSTimeInterval) -> NSString {
        
        let ti = NSInteger(interval)
        
        //var ms = Int((interval % 1) * 1000)
        
        let seconds = ti % 60
        let minutes = (ti / 60) % 60
        //var hours = (ti / 3600)
        
        //return NSString(format: "%0.2d:%0.2d:%0.2d.%0.3d",hours,minutes,seconds,ms)
        return NSString(format: "%0.2d:%0.2d",minutes,seconds)

    }
    
}



//Test BezierPath class
class SquareWithCircleView: NSView{
    override func drawRect(dirtyRect: NSRect)
    {
        let centerPoint = CGPoint (x: self.bounds.width / 2, y: self.bounds.width / 2)
        let circleRadius : CGFloat = self.bounds.width / 2 * 0.83
        let lineWidth: CGFloat = 4
        let strokeColor = NSColor.blueColor()
        let circlePath = NSBezierPath()
        
        circlePath.appendBezierPathWithArcWithCenter(centerPoint, radius: circleRadius, startAngle: CGFloat(M_PI_2 / 2 ), endAngle: CGFloat(M_PI_2), clockwise: true)
        //circlePath.closePath()


        strokeColor.set()
        circlePath.lineWidth = lineWidth
        circlePath.stroke()
        
        
        //var fillColor = NSColor.clearColor()
        //fillColor.set()
        //circlePath.fill()

        
    }
}



extension NSBezierPath {
    
    var CGPath: CGPathRef {
        
        get {
            return self.transformToCGPath()
        }
    }
    
    /// Transforms the NSBezierPath into a CGPathRef
    ///
    /// :returns: The transformed NSBezierPath
    private func transformToCGPath() -> CGPathRef {
        
        // Create path
        let path = CGPathCreateMutable()
        let points = UnsafeMutablePointer<NSPoint>.alloc(3)
        let numElements = self.elementCount
        
        if numElements > 0 {
            
            var didClosePath = true
            
            for index in 0..<numElements {
                
                let pathType = self.elementAtIndex(index, associatedPoints: points)
                
                switch pathType {
                    
                case .MoveToBezierPathElement:
                    CGPathMoveToPoint(path, nil, points[0].x, points[0].y)
                case .LineToBezierPathElement:
                    CGPathAddLineToPoint(path, nil, points[0].x, points[0].y)
                    didClosePath = false
                case .CurveToBezierPathElement:
                    CGPathAddCurveToPoint(path, nil, points[0].x, points[0].y, points[1].x, points[1].y, points[2].x, points[2].y)
                    didClosePath = false
                case .ClosePathBezierPathElement:
                    CGPathCloseSubpath(path)
                    didClosePath = true
                }
            }
            
            //if !didClosePath { CGPathCloseSubpath(path) }
        }
        
        points.dealloc(3)
        return path
    }
}