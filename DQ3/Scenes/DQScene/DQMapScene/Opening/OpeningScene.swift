//
//  OpeningScene.swift
//  DQ3
//
//  Created by aship on 2020/12/19.
//

import SpriteKit

class OpeningScene: DQMapScene {
    enum SceneFlag {
        case message_1_start
        case message_1_end
        case message_2_start
        case message_2_end
        case transition
    }
    
    var sceneFlag: SceneFlag = .message_1_start
    
    func setup() {
        self.scene.backgroundColor = .black
        
        let text1 = "それは　えにくすが　１６さいになる"
        let text2 = "たんじょうびの　ことであった"
        
        self.mapMessageWindowNode = MapMessageWindowNode()
        self.mapMessageWindowNode.showMessages(
            scene: self.scene,
            text1: text1,
            text2: text2,
            text3: nil,
            withSe: false,
            withNextMark: false,
            pointX: MapMessageWindowChildOfScenePointX,
            pointY: MapMessageWindowChildOfScenePointY,
            scale: self.scene.scale,
            completion: {
                self.sceneFlag = .message_1_end
            })
    }
}
