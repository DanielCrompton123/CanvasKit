//
//  File.swift
//  CanvasKit
//
//  Created by Daniel Crompton on 12/11/24.
//

import Foundation
import SwiftData
import PencilKit


@available(iOS 17.0, *)
@Model
public class DrawingModel {
    public var drawing: PKDrawing? {
        get {
            try? PKDrawing(data: _drawing)
        }
        set {
            _drawing = (newValue ?? PKDrawing()).dataRepresentation()
        }
    }
    
    private var _drawing: Data
    
    init(drawing: PKDrawing?) {
        _drawing = (drawing ?? PKDrawing()).dataRepresentation()
    }
}
