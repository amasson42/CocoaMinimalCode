
import Cocoa

class MyView: NSView {
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.createContent()
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createContent() {
        let helloWorldLabel = NSTextField(frame: self.frame)
        helloWorldLabel.isEditable = false
        helloWorldLabel.isSelectable = false
        helloWorldLabel.isBordered = false
        helloWorldLabel.drawsBackground = false
        helloWorldLabel.stringValue = "Hello, world !"
        helloWorldLabel.sizeToFit()
        self.addSubview(helloWorldLabel)
        helloWorldLabel.frame.origin.x = self.frame.midX - helloWorldLabel.frame.width / 2
        helloWorldLabel.frame.origin.y = self.frame.midY - helloWorldLabel.frame.height / 2
    }
    
    override func mouseDown(with event: NSEvent) {
        super.mouseDown(with: event)
        print("Mouse Click at \(event.locationInWindow)")
    }
}
