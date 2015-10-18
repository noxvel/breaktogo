//
//  TimerData.swift
//  BreakToGo
//
//  Created by Стас on 9/25/15.
//  Copyright © 2015 Younga. All rights reserved.
//

import Cocoa

class TimerData: NSObject {
    var workTime: Double
    var workRepeats: Int
    var shortBreak: Double
    var longBreak: Double
    var longBreakAfter: Int
    var allTime: Double
    var amountOfLongBreaks : Int
    var notificationSound: Int
    var launchMenubar: Int
    
    override init() {
        self.workTime = 0.4 * 60.0
        self.workRepeats = 5
        self.shortBreak = 0.125 * 60.0
        self.longBreak = 0.25 * 60.0
        self.longBreakAfter = 2
        self.amountOfLongBreaks = self.workRepeats / self.longBreakAfter
        self.allTime = self.workTime * Double(self.workRepeats) + Double(self.amountOfLongBreaks) * self.longBreak +
            self.shortBreak * (Double(self.workRepeats - amountOfLongBreaks) - 1)
        self.notificationSound = 1
        self.launchMenubar = 0
    }
    
    init(workTimeSec: Double, workRepeats: Int, shortBreakSec: Double, longBreakSec: Double, longBreakAfter: Int, notificationSound: Int, launchMenubar: Int){
        self.workTime = workTimeSec * 60
        self.workRepeats = workRepeats
        self.shortBreak = shortBreakSec * 60
        self.longBreak = longBreakSec * 60
        self.longBreakAfter = longBreakAfter
        self.amountOfLongBreaks = self.workRepeats / self.longBreakAfter
        self.allTime = self.workTime * Double(self.workRepeats) + Double(self.amountOfLongBreaks) * self.longBreak +
            self.shortBreak * (Double(self.workRepeats - amountOfLongBreaks) - 1)
        self.notificationSound = notificationSound
        self.launchMenubar = launchMenubar
    }
    
    required convenience init(coder decoder: NSCoder){
        self.init()
        self.workTime = decoder.decodeObjectForKey("workTime") as! Double
        self.workRepeats = decoder.decodeObjectForKey("workRepeats") as! Int
        self.shortBreak = decoder.decodeObjectForKey("shortBreak") as! Double
        self.longBreak = decoder.decodeObjectForKey("longBreak") as! Double
        self.longBreakAfter = decoder.decodeObjectForKey("longBreakAfter") as! Int
        self.amountOfLongBreaks = self.workRepeats / self.longBreakAfter
        self.allTime = self.workTime * Double(self.workRepeats) + Double(self.amountOfLongBreaks) * self.longBreak +
            self.shortBreak * (Double(self.workRepeats - amountOfLongBreaks) - 1)
        self.notificationSound = decoder.decodeObjectForKey("notificationSound") as! Int
        self.launchMenubar = decoder.decodeObjectForKey("launchMenubar") as! Int
    }
    
}

extension TimerData: NSCoding{
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.workTime, forKey: "workTime")
        coder.encodeObject(self.workRepeats, forKey: "workRepeats")
        coder.encodeObject(self.shortBreak, forKey: "shortBreak")
        coder.encodeObject(self.longBreak, forKey: "longBreak")
        coder.encodeObject(self.longBreakAfter, forKey: "longBreakAfter")
        coder.encodeObject(self.allTime, forKey: "allTime")
        coder.encodeObject(self.amountOfLongBreaks, forKey: "amountOfLongBreaks")
        coder.encodeObject(self.notificationSound, forKey: "notificationSound")
        coder.encodeObject(self.launchMenubar, forKey: "launchMenubar")
    }
}