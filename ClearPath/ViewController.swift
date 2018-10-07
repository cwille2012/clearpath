//
//  ViewController.swift
//  Clinic Captain
//
//  Created by Christopher Wille on 10/6/18.
//  Copyright © 2018 Christopher Wille. All rights reserved.
//
//ClearWay
//ClearPath

import UIKit
import SceneKit
import ARKit

let DEBUG = false;

class ViewController: UIViewController, ARSCNViewDelegate, UINavigationControllerDelegate {

    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet var roomInput: UITextField!
    @IBOutlet var logoHolder: UILabel!
    @IBOutlet var submitButtonOutlet: UIButton!
    @IBOutlet var resetButtonOutlet: UIButton!
    @IBOutlet var loadingOutlet: UILabel!
    @IBOutlet var logoOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        resetButtonOutlet.isHidden = true
        loadingOutlet.isHidden = true
        
        sceneView.delegate = self
        sceneView.showsStatistics = false
        
        sceneView.scene = SCNScene()
        
        self.sceneView.scene.rootNode.enumerateChildNodes { (node, stop) in node.removeFromParentNode() }
        sceneView.session.pause()
        sceneView.scene.rootNode.enumerateChildNodes { (node, stop) in node.removeFromParentNode() }
        if let configuration = sceneView.session.configuration {
            sceneView.session.run(configuration, options: .resetTracking)
        }
        
//        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.frame = view.bounds
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        sceneView.addSubview(blurEffectView)
        sceneView.addBlurEffect()
        
    }
    
    @IBAction func resetAllNodes(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.resetNodes()
        }
    }
    
    @IBAction func submitButton(_ sender: Any) {
        roomInput.resignFirstResponder()
        roomInput.isHidden = true
        logoHolder.isHidden = true
        submitButtonOutlet.isHidden = true
        loadingOutlet.isHidden = false
        logoOutlet.isHidden = true
        sceneView.removeBlurEffect()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.resetButtonOutlet.isHidden = true
            //self.resetButtonOutlet.isHidden = false
            self.drawNodes()
            self.loadingOutlet.isHidden = true
        }
    }
    
    func createSphereNode(with radius: CGFloat, color: UIColor) -> SCNNode {
        let geometry = SCNSphere(radius: radius)
        geometry.firstMaterial?.diffuse.contents = color
        let sphereNode = SCNNode(geometry: geometry)
        return sphereNode
    }
    
    func resetNodes() {
        self.sceneView.scene.rootNode.enumerateChildNodes { (node, stop) in node.removeFromParentNode() }
        self.sceneView.session.pause();
        if let configuration = self.sceneView.session.configuration {
            self.sceneView.session.run(configuration, options: .resetTracking)
        }
        self.drawNodes()
    }
    
    func drawNodes() {
      
        let nodes = [
            (0, 0, -1),  // 225 doorway
            (0, 0, -2),
            (0, 0, -3),
            (0, 0, -4),

            (1, 0, -4), // turn right
            (2, 0, -4),
            (3, 0, -4),
            (4, 0, -4),
            (5, 0, -4),
            (6, 0, -4),
            (7, 0, -4),
            (8, 0, -4),
            (9, 0, -4),
            (10, 0, -4),

            (10, 0, -5), // turn left
            (10, 0, -6), 
            (10, 0, -7), 
            (10, 0, -8), 
            (10, 0, -9),
            (10, 0, -10), 
            (10, 0, -11),
            (10, 0, -12),
            (10, 0, -13),
            (10, 0, -14),
            (10, 0, -15),
            (10, 0, -16),
            (10, 0, -17),
            (10, 0, -18),
            (10, 0, -19),
            (10, 0, -20),
            (10, 0, -21), 
            (10, 0, -22),
            (10, 0, -23),

            (11, 0, -23),  // turn right
            (12, 0, -23),
            (13, 0, -23),  
            (14, 0, -23),

            (14, 0, -22), // turn right and go down stairs
            (14, -0.5, -21),
            (14, -1, -20),
            (14, -1.5, -19),
            (14, -2, -18),
            (14, -2.5, -17),
            (14, -3, -16),
            (14, -3.5, -15),
            (14, -4, -14),
            (14, -4.5, -13),
            (14, -5, -12),

            (13, -5, -12),   // turn right
            (12, -5, -12),
            (11, -5, -12),

            (11, -5, -13),  // turn right
            (11, -5, -14),
            (11, -5, -15),
            (11, -5, -16),
            (11, -5, -17),
            (11, -5, -18),
            (11, -5, -19),
            (11, -5, -20),
            (11, -5, -21),
            (11, -5, -22),

            (12, -5, -22), // turn right (going underneath the stairs)
            (13, -5, -22), 
            (14, -5, -22),
            (15, -5, -22),
            (16, -5, -22),
            (17, -5, -22),
            (18, -5, -22),
            (19, -5, -22),
            (20, -5, -22),
            (21, -5, -22),
            (22, -5, -22),
            (23, -5, -22),
            (24, -5, -22),
            (25, -5, -22)
        ]
        for node in nodes {
//            let (startPoint, endPoint) = node;
//            let startV = SCNVector3(Double(startPoint.0), Double(startPoint.1), Double(startPoint.2));
//            let endV = SCNVector3(Double(endPoint.0), Double(endPoint.1), Double(endPoint.2));
//
//            let line = lineFrom(vector: startV, toVector: endV);
//
//            let lineNode = SCNNode(geometry: line)
//            lineNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue;
//            lineNode.setLineWidth
//            sceneView.scene.rootNode.addChildNode(lineNode)
            
            let childNode = createSphereNode(with: 0.03, color: .blue);
            childNode.position = SCNVector3(Double(node.0), Double(node.1 - 0.5), Double(node.2));
            childNode.opacity = 0.75;
           sceneView.scene.rootNode.addChildNode(childNode);
            
            
        }
    }
    
//    func lineFrom(vector vector1: SCNVector3, toVector vector2: SCNVector3) -> SCNGeometry {
//        let indices: [Int32] = [0, 1]
//        let source = SCNGeometrySource(vertices: [vector1, vector2])
//        let element = SCNGeometryElement(indices: indices, primitiveType: .line)
//        return SCNGeometry(sources: [source], elements: [element])
//    }
 
    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated);
        
        if DEBUG == true {
            // Enable world map feature points
            sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        }
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.vertical, .horizontal]
        sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
    }
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        return createOcclusionPlane(renderer: renderer, anchor: anchor, hasOutline: DEBUG) // Set to true to show wall boundries.
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        updateOcclusionPlane(node: node, anchor: anchor)
    }

}


extension ViewController: PlaneOccluding {
    func outlineColorForPlane(_ plane: ARPlaneAnchor) -> UIColor {
        let color = abs(plane.transform.up)
        return UIColor(red: CGFloat(color.x), green: CGFloat(color.y), blue: CGFloat(color.z), alpha: 0.8)
    }
    
    func outlineWidthForPlane(_ plane: ARPlaneAnchor) -> Measurement<UnitLength> {
        return Measurement(value: 5, unit: UnitLength.millimeters)
    }
}

extension ARSCNView
{
    func addBlurEffect()
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.addSubview(blurEffectView)
    }
    
    func removeBlurEffect() {
        let blurredEffectViews = self.subviews.filter{$0 is UIVisualEffectView}
        blurredEffectViews.forEach{ blurView in
            blurView.removeFromSuperview()
        }
    }
}

//extension UIView {
//
//    func removeBlurEffect() {
//        let blurredEffectViews = self.subviews.filter{$0 is UIVisualEffectView}
//        blurredEffectViews.forEach{ blurView in
//            blurView.removeFromSuperview()
//        }
//    }
//}
