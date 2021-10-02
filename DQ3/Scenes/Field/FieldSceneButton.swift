//
//  FieldSceneButton.swift
//  DQ3
//
//  Created by aship on 2020/12/29.
//

import SpriteKit

extension FieldScene {
    func willPress(_ button: ButtonOverlay) {
        if button == self.buttonA {
            processButtonA(mapCommandWindowNode: &self.mapCommandWindowNode,
                           mapMessageWindowNode: &self.mapMessageWindowNode,
                           scale: self.scale)
        }
        
        if button == self.buttonB {
            processButtonB(mapCommandWindowNode: self.mapCommandWindowNode,
                           mapMessageWindowNode: self.mapMessageWindowNode)
        }
    }
    
    func didPress(_ button: ButtonOverlay) {
    }
}
