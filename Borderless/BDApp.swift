//
//  BDApp.swift
//  Borderless Window
//
//  Created by Robert Kortenoeven on 08.08.23.
//

import SwiftUI
import AppKit


struct WindowAccessor: NSViewRepresentable {
    @Binding var window: NSWindow?
    
    func makeNSView(context: Context) -> NSView {
        let view = NSView()
        DispatchQueue.main.async {
            self.window = view.window   // << right after inserted in window
        }
        return view
    }
    
    func updateNSView(_ nsView: NSView, context: Context) {}
}


@main
struct BDApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State private var window: NSWindow?
    
    var body: some Scene {
        WindowGroup {
            BDMainView()
                .background(WindowAccessor(window: $window))
                .onChange(of: window) { newWindow in
                    newWindow?.styleMask.update(with: .fullSizeContentView) // Exclude title bar from content area
                    newWindow?.contentAspectRatio = CGSize(width: 16, height: 9)
                }
        }.windowStyle(HiddenTitleBarWindowStyle())
    }
}
