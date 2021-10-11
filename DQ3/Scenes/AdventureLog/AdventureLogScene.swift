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
    
    private func setup() {
        self.adventureLogTopWindowNode = AdventureLogTopWindowNode()
        self.adventureLogTopWindowNode?.addToScene(numberOfAdventureLogs: 3,
                                                   scene: self,
                                                   scale: self.scale)
    }
}
