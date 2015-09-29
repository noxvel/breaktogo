//
//  ContainerViewController.swift
//  BreakToGo
//
//  Created by Стас on 9/29/15.
//  Copyright © 2015 Younga. All rights reserved.
//

import Cocoa

class ContainerViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        let mainStoryboard: NSStoryboard = NSStoryboard(name: "Main", bundle: nil)
        let sourceViewController = mainStoryboard.instantiateControllerWithIdentifier("sourceViewController") as! NSViewController
        self.insertChildViewController(sourceViewController, atIndex: 0)
        
        self.view.addSubview(sourceViewController.view)
        self.view.frame = sourceViewController.view.frame
    }
    
    
}
