//
//  PKDrawing.swift
//  Build My Calculator
//
//  Created by Daniel Crompton on 10/27/24.
//

import PencilKit
import SwiftUI


extension PKDrawing {
    
    public func saveToPhotoLibrary() {
        // Generate a UIImage from the drawing (since only UIImages can be saved to photo library):
        let uiImage = self.image(from: self.bounds, scale: 1)
        
        // Call a UIKit method to save an image
        UIImageWriteToSavedPhotosAlbum(uiImage, nil, nil, nil)
    }
    
    public func image(scale: CGFloat = 1) -> Image {
        let uiImage = self.image(from: self.bounds, scale: scale)
        return Image(uiImage: uiImage)
    }
    
}




extension PKDrawing: @retroactive Identifiable {
    public var id: UUID { UUID() }
}



extension PKDrawing: @retroactive Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
