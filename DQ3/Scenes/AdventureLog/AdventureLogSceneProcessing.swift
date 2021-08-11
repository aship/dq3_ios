//
//  AdventureLogSceneProcessing.swift
//  DQ3
//
//  Created by aship on 2020/12/19.
//

import SpriteKit

extension AdventureLogScene {
    func setProcessing() {
        self.isProcessing = true
    }
    
    func setProcessingFinished() {
        self.isProcessing = false
    }
    
    override func update(_ currentTime: TimeInterval) {
        self.adventureLogTopWindowNode?.moveTriangle(direction: self.padDirection)
    }
}
