//
//  ViewController.swift
//  Testback
//
//  Created by Stanley Wong on 2018-02-15.
//  Copyright © 2018 Stanley Wong. All rights reserved.
//

import Cocoa

var numminutes: Double = 0
var somenum = 0
var message1: String = "DEFAULT_REMINDER!"

class ViewController: NSViewController {

    
    
    
    
    
    @IBOutlet weak var button_stop: NSButton!
    @IBOutlet weak var button_set: NSButton!
    @IBOutlet weak var minuteBoxS: NSPopUpButton!
    @IBOutlet weak var dropdown1: NSPopUpButton!
    @IBOutlet weak var textbox1: NSTextField!
    
    
    @IBOutlet weak var new: NSButton!
    
    var timer = Timer()
    
    @objc func alert(minutes: Double , messagetext: String) {
        let alert = NSAlert()
        alert.messageText = "It is set."
        alert.informativeText = "Your message \"\(messagetext)\" has been now been set to alert you every \(minutes) minutes."
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }


    @IBAction func exitButton(_ sender: Any) {
        timer.invalidate()
        
        button_set.isHidden = false
        button_stop.isHidden = true
        let alert = NSAlert()
        alert.messageText = "It is now reset."
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }
    @IBAction func setterButton(_ sender: Any) {
        //NSApp.mainWindow?.miniaturize(self)
        timer.invalidate()
        let theindex = minuteBoxS.indexOfSelectedItem
        if theindex == 0 {
            numminutes = 0.5
        } else if theindex == 1 {
            numminutes = 1
        } else if theindex == 2 {
            numminutes = 2
        } else if theindex == 3 {
            numminutes = 5
        } else if theindex == 4 {
            numminutes = 10
        }
        
        
        button_set.isHidden = true
        button_stop.isHidden = false
        
        
        //self.view.window?.close()
        
        message1 = textbox1.stringValue
        alert(minutes: numminutes , messagetext: message1)
        if let url = URL(string: "https://google.com"), NSWorkspace.shared.open(url) {
            print("default browser was successfully opened")
        }
        timer = Timer.scheduledTimer(timeInterval: (numminutes * 60), target: self, selector: #selector(
            ViewController.testing), userInfo: nil, repeats: true)
    }
    
    func showNotification() -> Void {
        
        let notification = NSUserNotification()
        notification.hasActionButton = true
        notification.otherButtonTitle = "OK"
        notification.actionButtonTitle = "Something"
        // All these values are optional
        notification.title = message1
        notification.subtitle = "BIG ALERT"
        //notification.informativeText = "Main informative text"
        //notification.contentImage = NSImage(contentsOf: NSURL(string: "http://Week01_StudentNotes")! as URL)
        notification.soundName = NSUserNotificationDefaultSoundName
        
        let notificationCenter = NSUserNotificationCenter.default
        notificationCenter.deliver(notification)
        /*self.NSUserNotificationCenter.defaultUserNotificationCenter.delegate = self
        switch (notification.activationType) {
        case .contentsClicked:
            
            exit(0)
        case .actionButtonClicked:
            exit(0)
        default:
            print("idklol")
            let url = URL(fileURLWithPath: Bundle.main.resourcePath!)
            let path = url.deletingLastPathComponent().deletingLastPathComponent().absoluteString
            let task = Process()
            task.launchPath = "/usr/bin/open"
            task.arguments = [path]
            task.launch()
            exit(0)
        }*/
    }
    
     @objc func testing() {
        /*
            NSApp.activate(ignoringOtherApps: true)
            
            let alert = NSAlert()
            alert.messageText = message1
            alert.addButton(withTitle: "Ok")
            alert.addButton(withTitle: "Give Up.")
        
            let result = alert.runModal()
            if result == NSApplication.ModalResponse.alertSecondButtonReturn {
                
                
                
                let url = URL(fileURLWithPath: Bundle.main.resourcePath!)
                let path = url.deletingLastPathComponent().deletingLastPathComponent().absoluteString
                let task = Process()
                task.launchPath = "/usr/bin/open"
                task.arguments = [path]
                task.launch()
                exit(0)
            }*/
        showNotification()
       
            
    
    }
    
    /*func userNotificationCenter(center: NSUserNotificationCenter, didActivateNotification notification: NSUserNotification) {
        switch (notification.activationType) {
        case .contentsClicked:
            
            exit(0)
        case .actionButtonClicked:
            exit(0)
        default:
            print("idklol")
            let url = URL(fileURLWithPath: Bundle.main.resourcePath!)
            let path = url.deletingLastPathComponent().deletingLastPathComponent().absoluteString
            let task = Process()
            task.launchPath = "/usr/bin/open"
            task.arguments = [path]
            task.launch()
            exit(0)
        }
    }*/
    
    
}

