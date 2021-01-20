//
//  OpeningScene.swift
//  DQ3
//
//  Created by aship on 2020/12/19.
//

import SpriteKit

class OpeningScene: BaseMapScene,
                    PadOverlayDelegate,
                    ButtonOverlayDelegate {
    enum SceneFlag {
        case message_1_start
        case message_1_end
        case message_2_start
        case message_2_end
        case transition
    }
    
    var sceneFlag: SceneFlag = .message_1_start
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        self.leftPad.delegate = self
        self.buttonA.delegate = self
        self.buttonB.delegate = self
    }
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .black
        
        setupVirtualPad(leftPad: self.leftPad,
                        buttonA: self.buttonA,
                        buttonB: self.buttonB)
        
        let text1 = "それは　えにくすが　１６さいになる"
        let text2 = "たんじょうびの　ことであった"
        
        showMessages(text1: text1,
                     text2: text2,
                     text3: nil,
                     withSe: false,
                     withNextMark: false,
                     messageWindowNode: &self.messageWindowNode,
                     isMessageWindowOpen: &self.isMessageWindowOpen,
                     scale: self.scale,
                     completion: {
                        self.sceneFlag = .message_1_end
                     })
    }
}
