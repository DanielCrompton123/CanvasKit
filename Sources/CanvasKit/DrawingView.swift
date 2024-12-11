//
//  DrawingView.swift
//  Build My Calculator
//
//  Created by Daniel Crompton on 11/23/24.
//

import SwiftUI
import PencilKit



public struct DrawingView: View {
    public let drawing: PKDrawing
    public var contentMode: ContentMode = .fit
    
    public var body: some View {
        GeometryReader { geom in
            let imageScale = geom.size.width / drawing.bounds.width
            
            drawing.image(scale: imageScale)
                .resizable()
                .aspectRatio(contentMode: contentMode)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}



@available(iOS 17.0, *)
#Preview {
    @Previewable @State var drawing: PKDrawing = .init()
    
    NavigationStack {
        VStack {
            NavigationLink("Draw") {
                CanvasView(drawing: $drawing, toolPickerShows: .constant(true))
            }
            
            DrawingView(drawing: drawing)
                .frame(width: 75, height: 75)
                .aspectRatio(1, contentMode: .fit)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.background, lineWidth: 5)
                        .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: 3)
                }
            
        }
    }
}
