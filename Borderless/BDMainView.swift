//
//  ContentView.swift
//  Borderless Window
//
//  Created by Robert Kortenoeven on 08.08.23.
//

import Foundation
import SwiftUI

@available(OSX 11.0, *)
extension View {
    func dragWndWithClick() -> some View {
        self.overlay(BDMainView())
    }
}


struct BDMainView: View {
    @State private var draggedOffset = CGSize.zero
    
    var body: some View {
        GeometryReader { geometry in
            Text("Well hello there, Borderless Window!")
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.white)
                .edgesIgnoringSafeArea(.all)
                .overlay( DragWndNSRepr())
        }
    }
    
    
    //Draggable window code from here: https://stackoverflow.com/questions/70271012/swiftui-drag-window-with-left-mouse-button-down-on-the-view
    // Add this to your subview to make the surrounding window draggable: .overlay( DragWndNSRepr())
    
    fileprivate struct DragWndNSRepr: NSViewRepresentable {
        func makeNSView(context: Context) -> NSView {
            return DragWndNSView()
        }
        
        func updateNSView(_ nsView: NSView, context: Context) { }
    }
    
    fileprivate class DragWndNSView: NSView {
        override public func mouseDown(with event: NSEvent) {
            window?.performDrag(with: event)
        }
    }
    
}
