//
//  OptionsViewController.swift
//  BreakToGo
//
//  Created by Стас on 9/30/15.
//  Copyright © 2015 Younga. All rights reserved.
//

import Cocoa

class OptionsViewController: NSViewController {

    var data: TimerData?
    
    @IBOutlet weak var workTime: NSTextField!
    @IBOutlet weak var workRepeats: NSTextField!
    @IBOutlet weak var shortBreak: NSTextField!
    @IBOutlet weak var longBreak: NSTextField!
    @IBOutlet weak var longBreakAfter: NSTextField!
    
    override func prepareForSegue(segue: NSStoryboardSegue, sender: AnyObject?) {
        let timerView = segue.destinationController as! TimerViewController
        
        //data = TimerData(workTimeSec: workTime.integerValue,workRepeats: workRepeats.integerValue,shortBreakSec: 10)
        writeDataToObject()
        
        timerView.representedObject = data
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do view setup here.
        //data = TimerData(workTimeSec: 30,workRepeats: 2,shortBreakSec: 10)
    }
    
    
    override func viewWillAppear() {
        if let data = self.representedObject as? TimerData{
            self.data = data
            
            workTime.doubleValue = self.data!.workTime / 60
            workRepeats.integerValue = self.data!.workRepeats
            shortBreak.doubleValue = self.data!.shortBreak / 60
            longBreak.doubleValue = self.data!.longBreak / 60
            longBreakAfter.integerValue = self.data!.longBreakAfter
        }
        self.view.layer?.backgroundColor = NSColor.whiteColor().CGColor
    }
    
    func writeDataToObject(){
        data = TimerData(workTimeSec: workTime.doubleValue, workRepeats: workRepeats.integerValue, shortBreakSec: shortBreak.doubleValue, longBreakSec: longBreak.doubleValue, longBreakAfter: longBreakAfter.integerValue)
    }
    
}
