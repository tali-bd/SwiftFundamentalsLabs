import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    var selectedNode: SCNNode?
    var placedNodes: [SCNNode] = []
    var planeNodes: [SCNNode] = []
    var lastObjectPlacedPoint: CGPoint?
    let touchDistanceThreshold: CGFloat = 40.0
    
    @IBOutlet var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    enum ObjectPlacementMode {
        case freeform, plane, image
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        sceneView.autoenablesDefaultLighting = true
    }
    
    var objectMode: ObjectPlacementMode = .freeform {
        didSet {
                reloadConfiguration(removeAnchors: false)
            }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadConfiguration()
    }

    func reloadConfiguration(removeAnchors: Bool = true) {
        
        configuration.planeDetection = [.horizontal, .vertical]
        configuration.detectionImages = (objectMode == .image) ? ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) : nil
        
        let options: ARSession.RunOptions
            
            if removeAnchors {
                options = [.removeExistingAnchors]
                for node in planeNodes {
                    node.removeFromParentNode()
                }
                planeNodes.removeAll()
                for node in placedNodes {
                    node.removeFromParentNode()
                }
                placedNodes.removeAll()
            } else {
                options = []
            }
        
            sceneView.session.run(configuration, options: options)
        }

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //print("In touchesBegan")
        
        super.touchesBegan(touches, with: event)
        
        //print("Made it past first line")
        
        //Check if selected node has value
        guard let node = selectedNode else { print("no node selected") ; return }
                
        guard let touch = touches.first else { print("no touch") ; return }
        
        switch objectMode {
        case .freeform:
            
            //print("In freeform")
            
            addNodeInFront(node)
            
            placedNodes.append(node); print("node should be added to array")
            
            
        case .plane:
            
            //print("In plane case")
            
            let touchPoint = touch.location(in: sceneView)
            addNode(node, toPlaneUsingPoint: touchPoint)
            placedNodes.append(node) ; print("node should be added to array")
            
        case .image:
            
            //print("In image case")
            
            break // Need to implement
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        guard objectMode == .plane,
            let node = selectedNode,
            let touch = touches.first,
            let lastTouchPoint = lastObjectPlacedPoint else {
                return
            }
        
        let newTouchPoint = touch.location(in: sceneView)
        let distance = sqrt(pow((newTouchPoint.x - lastTouchPoint.x), 2.0) + pow((newTouchPoint.y - lastTouchPoint.y), 2.0))
        
        if distance > touchDistanceThreshold {
                addNode(node, toPlaneUsingPoint: newTouchPoint)
            }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        lastObjectPlacedPoint = nil
    }
    

    @IBAction func changeObjectMode(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            objectMode = .freeform
        case 1:
            objectMode = .plane
        case 2:
            objectMode = .image
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showOptions" {
            let optionsViewController = segue.destination as! OptionsContainerViewController
            optionsViewController.delegate = self
        }
    }
    
    func addNodeInFront(_ node: SCNNode) {
        guard let currentFrame = sceneView.session.currentFrame else { return }
        
        // Set transform of node to be 20cm in front of camera
        var translation = matrix_identity_float4x4
        translation.columns.3.z = -0.4
        node.simdTransform = matrix_multiply(currentFrame.camera.transform, translation)
        
        let cloneNode = node.clone()
        sceneView.scene.rootNode.addChildNode(cloneNode)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if let imageAnchor = anchor as? ARImageAnchor {
            nodeAdded(node, for: imageAnchor)
        } else if let planeAnchor = anchor as? ARPlaneAnchor {
            nodeAdded(node, for: planeAnchor)
        }
        
        guard let planeAnchor = anchor as? ARPlaneAnchor,
                let planeNode = node.childNodes.first,
                let plane = planeNode.geometry as? SCNPlane else {
                    return
                }
            
            planeNode.position = SCNVector3(planeAnchor.center.x, 0, planeAnchor.center.z)
            plane.width = CGFloat(planeAnchor.extent.x)
            plane.height = CGFloat(planeAnchor.extent.z)
    } // Checks for recognized images and planes and adds a node

    func nodeAdded(_ node: SCNNode, for anchor: ARImageAnchor) {
        if let selectedNode = selectedNode {
            addNode(selectedNode, toImageUsingParentNode: node)
        }
    }


    func nodeAdded(_ node: SCNNode, for anchor: ARPlaneAnchor) {
        
        let floor = createFloor(planeAnchor: anchor)
        
        node.addChildNode(floor)
        planeNodes.append(floor)
    }

    func addNode(_ node: SCNNode, toImageUsingParentNode parentNode: SCNNode) {
        let cloneNode = node.clone()
        parentNode.addChildNode(cloneNode)
        
    }
    
    func addNode(_ node:SCNNode, toPlaneUsingPoint point: CGPoint)
    {
        let results = sceneView.hitTest(point, types: [.existingPlaneUsingExtent])
            
            if let match = results.first {
    
                let t = match.worldTransform
                node.position = SCNVector3(x: t.columns.3.x, y: t.columns.3.y, z: t.columns.3.z)
                
                let cloneNode = node.clone()
                sceneView.scene.rootNode.addChildNode(cloneNode)
                
                lastObjectPlacedPoint = point
                
                //addNodeToSceneRoot(node)
            }else
        {
                print("No plane detected at point")
            }
        
        print("Hit test results: ", results)
    }
    
    func addNodeToSceneRoot(_ node: SCNNode)
    {
        sceneView.scene.rootNode.addChildNode(node)
    }
    
    func createFloor(planeAnchor: ARPlaneAnchor) -> SCNNode {
        let node = SCNNode()
        
        let geometry = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
        node.geometry = geometry
        
        node.eulerAngles.x = -Float.pi / 2
        node.opacity = 0.25
        
        return node
    }
    


} // End of class function

extension ViewController: OptionsViewControllerDelegate {
    
    func objectSelected(node: SCNNode) {
        dismiss(animated: true, completion: nil)
        selectedNode = node
    }
    
    func togglePlaneVisualization() {
        dismiss(animated: true, completion: nil)
    }
    
    func undoLastObject() {
        print("Undo was pressed")
        
        if let lastNode = placedNodes.last {
            
            print("assigned lastNode")
            
            lastNode.removeFromParentNode()
            
            print("Last node was removed from parent node")
            
            placedNodes.removeLast()
            
            print("Last node removed from placedNodes array")
        }
    }
    
    func resetScene() {
        dismiss(animated: true, completion: nil)
        reloadConfiguration()
    }
}


