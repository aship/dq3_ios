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
    var adventureLogTopWindowNode: AdventureLogTopWindowNode?
    var isProcessing = false
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        self.leftPad.delegate = self
        self.buttonA.delegate = self
        self.buttonB.delegate = self
    }
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .black
        
        setup()
        
        setupVirtualPad(leftPad: self.leftPad,
                        buttonA: self.buttonA,
                        buttonB: self.buttonB)
    }
    
    func setup() {
        self.adventureLogTopWindowNode = AdventureLogTopWindowNode()
        self.adventureLogTopWindowNode?.addToScene(scene: self,
                                                   numberOfAdventureLogs: 3,
                                                   scale: self.scale)
    }
}
