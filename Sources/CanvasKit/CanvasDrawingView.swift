//
//  CanvasDrawingView.swift
//  Build My Calculator
//
//  Created by Daniel Crompton on 11/18/24.
//

import SwiftUI
import PencilKit


public struct CanvasDrawingView: View {
    @Binding public var drawing: PKDrawing
    @Binding public var toolPickerShows: Bool
    
    public var shareButtonShows = true
    public var saveButtonShows = false
    
    public var body: some View {
        NavigationStack {
            CanvasView(drawing: $drawing, toolPickerShows: $toolPickerShows)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("\(toolPickerShows ? "Hide" : "Show") tool picker", systemImage: "wrench.adjustable") {
                            toolPickerShows.toggle()
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Erase all", systemImage: "trash") {
                            drawing = PKDrawing()
                        }
                    }
                    
                    if shareButtonShows {
                        ToolbarItem(placement: .topBarLeading) {
                            let image = drawing.image()
                            ShareLink(item: image,
                                      subject: Text("Drawing"),
                                      message: Text("Drawn with MyApp!"),
                                      preview: SharePreview("Drawing", image: image)) {
                                Label("Share", systemImage: "square.and.arrow.up")
                            }
                        }
                    }
                    
                    if saveButtonShows {
                        ToolbarItem(placement: .topBarLeading) {
                            Button("Save drawing", systemImage: "arrow.down.doc") {
                                drawing.saveToPhotoLibrary()
                            }
                        }
                    }
                }
        }
    }
}

