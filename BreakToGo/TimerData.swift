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
    
    override init() {
        self.workTime = 0.4 * 60.0
        self.workRepeats = 5
        self.shortBreak = 0.125 * 60.0
        self.longBreak = 0.25 * 60.0
        self.longBreakAfter = 2
        self.amountOfLongBreaks = self.workRepeats / self.longBreakAfter
        self.allTime = self.workTime * Double(self.workRepeats) + Double(self.amountOfLongBreaks) * self.longBreak +
            self.shortBreak * (Double(self.workRepeats - amountOfLongBreaks) - 1)
    }
    
    init(workTimeSec: Double, workRepeats: Int, shortBreakSec: Double, longBreakSec: Double, longBreakAfter: Int){
        self.workTime = workTimeSec * 60
        self.workRepeats = workRepeats
        self.shortBreak = shortBreakSec * 60
        self.longBreak = longBreakSec * 60
        self.longBreakAfter = longBreakAfter
        self.amountOfLongBreaks = self.workRepeats / self.longBreakAfter
        self.allTime = self.workTime * Double(self.workRepeats) + Double(self.amountOfLongBreaks) * self.longBreak +
            self.shortBreak * (Double(self.workRepeats - amountOfLongBreaks) - 1)
    }
    
}
