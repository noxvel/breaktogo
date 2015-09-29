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
    
    override init() {
        self.workTime = 1.0 * 15
        self.workRepeats = 3
        self.shortBreak = 1.0 * 5
        self.longBreak = 1.0 * 60
        self.longBreakAfter = 3
        self.allTime = self.workTime * Double(self.workRepeats) + self.shortBreak * (Double(self.workRepeats) - 1)
    }
    
}
