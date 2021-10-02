//
//  BattleScene.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

class BattleScene: DQScene {
    var battleStatus: BattleStatus = .start
    
    let messageWindowNode = SKSpriteNode(imageNamed: "battle/message_window.png")
    let mapCommandWindowNode = SKSpriteNode(imageNamed: "battle/command_window.png")
    let statusWindowNode = SKSpriteNode(imageNamed: "battle/status_window.png")
    let targetWindowNode = SKSpriteNode(imageNamed: "battle/target_window.png")
    
    let labelNode = SKLabelNode(fontNamed: "AvenirNext-Bold")
    
    let nodeSlime = SKSpriteNode(imageNamed: "monster/slime.png")
    let nodeIkkaku = SKSpriteNode(imageNamed: "monster/ikkaku.png")
    
    func setup() {
        AudioManager.play(dqAudio: .battle)
        
        self.scene.backgroundColor = .black
        
        addMessageWindow(windowNode: self.messageWindowNode,
                         labelNode: self.labelNode,
                         scale: self.scene.scale)
        
        addEnemy(node: self.nodeSlime,
                 scale: self.scene.scale)
        
        addEnemy2(node: self.nodeIkkaku,
                  scale: self.scene.scale)
        
        addCommandWindow(node: self.mapCommandWindowNode,
                         scale: self.scene.scale)
        
        addTargetWindow(node: self.targetWindowNode,
                        scale: self.scene.scale)
        
        addStatusWindow(node: self.statusWindowNode,
                        scale: self.scene.scale)
    }
}
