//
//  AdventureLogScene.swift
//  DQ3
//
//  Created by aship on 2020/12/18.
//

import SpriteKit

class AdventureLogScene: DQScene {
    var isProcessing = false
    
    let windowNode = SKSpriteNode(imageNamed: "select_file_window.png")

    func setup() {
        DataManager.dqSceneType = .adventure_log
        
        self.scene.backgroundColor = .black
        
        self.scene.leftPad.isHidden = false
        self.scene.buttonA.isHidden = false
        self.scene.buttonB.isHidden = false
        
        addWindow(scale: self.scene.scale)
    }
}
