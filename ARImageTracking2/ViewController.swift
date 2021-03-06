//
//  ViewController.swift
//  ARImageTracking2
//
//  Created by Prem Nalluri on 08/12/19.
//  Copyright © 2019 AgathsyaTechnologies. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import AVFoundation

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/SceneKit Scene.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
       // let configuration = ARWorldTrackingConfiguration()
        let configuration = ARImageTrackingConfiguration()
        guard let arImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources Group", bundle: nil) else{return}
               configuration.trackingImages = arImages
        
        // Run the view's session
        sceneView.session.run(configuration)
//        let configuration = ARWorldTrackingConfiguration()
//        configuration.planeDetection = .horizontal
        //sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
       
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard anchor is ARImageAnchor else {return}
        //container
        guard let container = sceneView.scene.rootNode.childNode(withName: "container", recursively: false) else {
            return
        }
        container.removeFromParentNode()
        node.addChildNode(container)
        container.isHidden = false
       // let videoURL = Bundle.main.url(forResource: "video", withExtension: "mp4")
       // let videoPlayer = AVPlayer(url: videoURL!)
        //let videoScene = SKScene(size: CGSize(width: 720, height: 1280))
        //let videoNode = SKVideoNode(avPlayer: videoPlayer)
        //videoNode.position = CGPoint(x: videoScene.size.width/2, y: videoScene.size.height/2)
        //videoNode.size = videoScene.size
        //videoNode.yScale = -1
        //videoNode.play()
        //videoScene.addChild(videoNode)
       // guard let video = container.childNode(withName: "video", recursively: false)else{return}
        //video.geometry?.firstMaterial?.diffuse.contents = videoScene
        
        
    }
    
}
