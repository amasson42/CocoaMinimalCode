
import SceneKit

class MyView: SCNView {
    
    override init(frame: NSRect, options: [String : Any]? = nil) {
        super.init(frame: frame, options: options)
        self.makeBasicScene()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeBasicScene() {
        let scene = SCNScene()
        
        scene.background.contents = NSColor.blue
        
        let camera = SCNNode()
        camera.camera = SCNCamera()
        camera.position = SCNVector3(0, 0, 3)
        scene.rootNode.addChildNode(camera)
        
        let node = SCNNode()
        node.geometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0.1)
        node.geometry?.materials.first?.diffuse.contents = NSColor.red
        scene.rootNode.addChildNode(node)
        
        self.scene = scene
        
        self.showsStatistics = true
        self.allowsCameraControl = true
        self.autoenablesDefaultLighting = true
        NSLog("Command line: \(CommandLine.arguments)")
    }
    
    override func mouseDown(with event: NSEvent) {
        super.mouseDown(with: event)
        NSLog("mouse Event \(event)")
    }
}
