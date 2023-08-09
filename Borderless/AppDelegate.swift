//
//  AppDelegate.swift
//  Borderless Window
//
//  Created by Robert Kortenoeven on 08.08.23.
//

import SwiftUI
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        hideTitleBar()
    }
    
    func hideTitleBar() {
        let window = NSApplication.shared.windows.first!
        window.titlebarAppearsTransparent = true
        window.backgroundColor = .black
    }
}

