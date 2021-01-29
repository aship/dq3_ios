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
            processButtonA(mapCommandWindowNode: &self.mapCommandWindowNode,
                           mapMessageWindowNode: &self.mapMessageWindowNode,
                           scale: self.scene.scale)
        }
        else if button == self.scene.buttonB {
            processButtonB(mapCommandWindowNode: self.mapCommandWindowNode,
                           mapMessageWindowNode: self.mapMessageWindowNode)
        }
    }
    
    func processTalk(headNode: CharacterNode) -> (Bool, String, String?, String?) {
        let withSe = false
        let text1 = "そのほうこうには　だれも　いない。"
        
        return (withSe, text1, nil, nil)
    }
}
