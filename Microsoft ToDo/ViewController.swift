//
//  ViewController.swift
//  Microsoft ToDo
//
//  Created by Michael Dilger on 14.05.17.
//  Copyright © 2017 Michael Dilger. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {
    
    @IBOutlet weak var WebView: WebView!
    override func viewDidLoad() {
        super.viewDidLoad()
            let targetURL = URL(string: "https://todo.microsoft.com/login")
            let request = URLRequest(url: targetURL!)
            self.WebView.mainFrame.load(request)
            view.window?.titlebarAppearsTransparent = true
            view.window?.titleVisibility = .hidden
            view.window?.styleMask = NSWindowStyleMask.fullSizeContentView

    }
    
    
    override var representedObject: Any? {
        didSet {
            if let cookies = HTTPCookieStorage.shared.cookies {
                for cookie in cookies {
                    NSLog("\(cookie)")
                }
            }
            let storage = HTTPCookieStorage.shared
            for cookie in storage.cookies! {
                storage.deleteCookie(cookie)
            }
        }
    }
}




