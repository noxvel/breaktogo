//
//  AppDelegate.swift
//  BreakToGo
//
//  Created by Стас on 9/28/15.
//  Copyright © 2015 Younga. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var mainWindow:NSWindow?
    var statusBarWindow:NSWindow?
    var dataForTimer:TimerData?
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-2)
    let popover = NSPopover()

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        //NSApplication.sharedApplication().windows.last!.close()
        // lets get rid of the main window just closing it as soon as the app launches

        mainWindow = NSApplication.sharedApplication().windows.last as NSWindow!
        statusBarWindow = NSApplication.sharedApplication().windows.first as NSWindow!
        
        
        if let data = NSUserDefaults.standardUserDefaults().objectForKey("timerData") as? NSData {
            self.dataForTimer = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? TimerData
        } else if self.dataForTimer == nil{
            self.dataForTimer = TimerData()
        }
        
        if self.dataForTimer?.launchMenubar == 0 {
            statusBarWindow?.close()
        }else{
            mainWindow?.close()
            
            if let button = statusItem.button {
                button.image = NSImage(named: "StatusIcon")
                button.action = Selector("togglePopover:")
            }
            popover.contentViewController = NSStoryboard(name: "Main", bundle: nil).instantiateControllerWithIdentifier("containerViewController") as? NSViewController
        }
        
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        if dataForTimer?.launchMenubar == 0 {
            return true
        }else{
            return false
        }
    }
    
    
    
    func showPopover(sender: AnyObject?) {
        if let button = statusItem.button {
            popover.showRelativeToRect(button.bounds, ofView: button, preferredEdge: NSRectEdge.MinY)
        }
    }
    
    func closePopover(sender: AnyObject?) {
        popover.performClose(sender)
    }
    
    func togglePopover(sender: AnyObject?) {
        if popover.shown {
            closePopover(sender)
        } else {
            showPopover(sender)
        }
    }

}

