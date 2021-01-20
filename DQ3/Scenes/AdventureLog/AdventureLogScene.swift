//
//  AdventureLogScene.swift
//  DQ3
//
//  Created by aship on 2020/12/18.
//

import SpriteKit

class AdventureLogScene: BaseScene,
                         PadOverlayDelegate,
                         ButtonOverlayDelegate {
    let nodeWindow = SKSpriteNode(imageNamed: "select_file_window.png")
    
    var isProcessing = false
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        self.leftPad.delegate = self
        self.buttonA.delegate = self
        self.buttonB.delegate = self
    }
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .black
        
        addWindow(windowNode: self.nodeWindow,
                  scale: self.scale)
        
        
        setupVirtualPad(leftPad: self.leftPad,
                        buttonA: self.buttonA,
                        buttonB: self.buttonB)
    }
}
