//
//  CanvasView.swift
//  Build My Calculator
//
//  Created by Daniel Crompton on 10/24/24.
//

import SwiftUI
import PencilKit


public struct CanvasView: UIViewRepresentable {
    @Binding public var drawing: PKDrawing
    @Binding public var toolPickerShows: Bool
        
    private let canvasView = PKCanvasView()
    private let toolPicker = PKToolPicker()
    
        
    public func makeUIView(context: Context) -> PKCanvasView {
        canvasView.drawing = drawing
        canvasView.delegate = context.coordinator
        // Allow finger drawing
        canvasView.drawingPolicy = .anyInput
        
        // Add tool palette
        toolPicker.setVisible(toolPickerShows, forFirstResponder: canvasView)
        
        // Make canvas observe notifications (mainly tool changes) posted by tool picker
        toolPicker.addObserver(canvasView)
        
        if toolPickerShows {
            canvasView.becomeFirstResponder()
        }
        
        return canvasView
    }
    
    public func updateUIView(_ canvasView: PKCanvasView, context: Context) {
        // Executes when either drawing or toolPickerShows is updates.
        // SwiftUI updates call this method not UIKit updates
        
        // Show or hide the tool picker
        toolPicker.setVisible(toolPickerShows, forFirstResponder: canvasView)
        
        // Update the observer, by why?
        toolPicker.addObserver(canvasView)
        
        if toolPickerShows {
            canvasView.becomeFirstResponder()
        } else {
            canvasView.resignFirstResponder()
        }
        
        // Update drawing
        if canvasView.drawing != drawing {
            canvasView.drawing = drawing
        }
    }
    
    static public func saveImage(from drawing: PKDrawing, scale: CGFloat = 1) {
        let image = drawing.image(from: drawing.bounds, scale: scale)
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        // ^^^ The app's Info.plist must contain an NSPhotoLibraryAddUsageDescription key with a string value explaining to the user how the app uses this data.
    }
    
    
    //MARK: - Delegation
    
    public class Coordinator: NSObject, PKCanvasViewDelegate {
        var drawing: Binding<PKDrawing>
        
        init(drawing: Binding<PKDrawing>) {
            self.drawing = drawing
        }
        
        // When the drawing updates keep the drawing binding in sync
        public func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
            drawing.wrappedValue = canvasView.drawing
        }
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(drawing: $drawing)
    }
    
}
