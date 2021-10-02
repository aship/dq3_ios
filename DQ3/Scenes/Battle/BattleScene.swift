//
//  BattleScene.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

class BattleScene: BaseScene,
                   PadOverlayDelegate,
                   ButtonOverlayDelegate {
    let messageWindowNode = SKSpriteNode(imageNamed: "battle/message_window.png")
    let commandWindowNode = SKSpriteNode(imageNamed: "battle/command_window.png")
    let nodeStatusWindow = SKSpriteNode(imageNamed: "battle/status_window.png")
    let nodeTargetWindow = SKSpriteNode(imageNamed: "battle/target_window.png")
    
    let labelNode = SKLabelNode(fontNamed: "AvenirNext-Bold")
    
    let nodeSlime = SKSpriteNode(imageNamed: "monster/slime.png")
    let nodeIkkaku = SKSpriteNode(imageNamed: "monster/ikkaku.png")
    
    var battleStatus: BattleStatus = .start
    
    var heroMapPositionX: Int = 0
    var heroMapPositionY: Int = 0
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        self.leftPad.delegate = self
        self.buttonA.delegate = self
        self.buttonB.delegate = self
    }
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .black
        
        addMessageWindow(windowNode: self.messageWindowNode,
                         labelNode: self.labelNode,
                         scale: self.scale)
        
        addEnemy(node: self.nodeSlime,
                 scale: self.scale)
        addEnemy2(node: self.nodeIkkaku,
                  scale: self.scale)
        
        addCommandWindow(node: self.commandWindowNode,
                         scale: self.scale)
        addTargetWindow(node: self.nodeTargetWindow,
                        scale: self.scale)
        addStatusWindow(node: self.nodeStatusWindow,
                        scale: self.scale)
        
        setupVirtualPad(leftPad: self.leftPad,
                        buttonA: self.buttonA,
                        buttonB: self.buttonB)
        
        AudioManager.play(dqAudio: .battle)
    }
}
