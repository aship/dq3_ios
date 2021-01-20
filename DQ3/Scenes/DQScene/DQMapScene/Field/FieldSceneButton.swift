//
//  FieldSceneButton.swift
//  DQ3
//
//  Created by aship on 2020/12/29.
//

import SpriteKit

extension FieldScene {
    func willPress(_ button: ButtonOverlay) {
        if button == self.scene.buttonA {
            processButtonA(processTalk: processTalk,
                           commandWindowNode: &self.commandWindowNode,
                           messageWindowNode: &self.messageWindowNode,
                           triangleNode: self.scene.triangleNode,
                           isCommandWindowOpen: &self.isCommandWindowOpen,
                           isMessageWindowOpen: &self.isMessageWindowOpen,
                           scale: self.scene.scale)
        }
        else if button == self.scene.buttonB {
            processButtonB(commandWindowNode: self.commandWindowNode,
                           messageWindowNode: self.messageWindowNode,
                           isCommandWindowOpen: &self.isCommandWindowOpen,
                           isMessageWindowOpen: &self.isMessageWindowOpen)
        }
    }
    
    func processTalk(headNode: CharacterNode) -> (Bool, String, String?, String?) {
        let withSe = false
        let text1 = "そのほうこうには　だれも　いない。"
        
        return (withSe, text1, nil, nil)
    }
}
