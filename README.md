# CanvasKit

A simple and lightweight package that encapsulates `PencilKit`'s `PKCanvasView` putting it inside a SwiftUI context with `CanvasView` and includes a fully-fledged drawing UI - `CanvasDrawingView`!

## Installation

Copy the github link (in the green *code* button's dropdown) and add as a dependency to Xcode, using **Swift package manager**. Go to project settings > Dependencies and press Add. Now paste the github link into the search field and add this package.

## Documentation

### `CanvasView` vs `CanvasDrawingView`

You may either use the `CanvasView` directly for fine-grained control over its appearance, or use the `CanvasDrawingView`. **The `CanvasDrawingView` coontains the `CanvasView` inside a navigation stack and adds relevant buttons**, to show/hide the tool picker, save / share the drawing and delete the drawing. Therefore, if you want to customize these buttons, put `CanvasView` inside your own UI.

### What is `DrawingView`

**If you want to display a user's PKDrawing in a SwiftUI view, I've included a `DrawingView` that accepts a `PKDrawing` and displays it**. It manages the drawing's scale in the frame it is given. 

For example, if the drawing was drawn at 50x100pt and the frame for this view was 300x600pt the drawing would be scaled up and become pixelated. The [`PKDrawing.image(from:scale:)`](https://developer.apple.com/documentation/pencilkit/pkdrawing-swift.struct/image(from:scale:)-220d0#:~:text=The%20scale%20factor%20at%20which%20to%20create%20the%20image.%20Specifying%20scale%20factors%20greater%20than%201.0%20creates%20an%20image%20with%20more%20detail.%20For%20example%2C%20you%20might%20specify%20a%20scale%20factor%20of%202.0%20or%203.0%20when%20displaying%20the%20image%20on%20a%20Retina%20display.) method scales the drawing strokes up/down without making them pixelated so this is how my view works.

### What is `DrawingModel`?

`PKDrawing` is one of the many things that you *should* be able to store in `SwiftData` that raises a SwiftData error due to an internal bug (I'm presuming).

The workaround to this is **persisting the drawing's data in `SwiftData` (with the `PKDrawing.dataRepresentation`) and retrieving the actual drawing with `PKDrawing.init(data:)`**. This is the purpose of the `DrawingModel`.

It can only be used if you only want to store a drawing in SwiftData model.

## Usage

the license for this package is, do whatever you want with it, you can sell, modify & redistribute it. Anything.
