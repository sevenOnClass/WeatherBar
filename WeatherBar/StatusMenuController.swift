//
//  StatusMenuController.swift
//  WeatherBar
//
//  Created by zhuangqi on 2018/1/14.
//  Copyright © 2018年 zhuangqi. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {

    @IBOutlet weak var statusMenu: NSMenu!
    let weatherAPI = WeatherAPI()
    
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    override func awakeFromNib() {
        
        statusItem.title = "WeatherBar"
        let icon = NSImage.init(named: "statusIcon")
        icon?.isTemplate = true
        
        statusItem.image = icon
        statusItem.menu = statusMenu
        
        updateWeather()
        
    }
    
    func updateWeather() -> Void {
        weatherAPI.fetchWeather(query: "Beijing")
    }
    
    
    @IBAction func quitClicked(_ sender: NSMenuItem) {
        NSApplication.shared().terminate(self)
    }
    @IBAction func updateClicked(_ sender: NSMenuItem) {
        updateWeather()
    }
}
