//
//  MapCommandWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/01/21.
//

import SpriteKit

extension MapCommandWindowNode {
    func processButtonA() -> Bool {
        pauseTriangleAnimation(triangleNode: self.triangleNode)
        
        if self.commandWindowStatus == .processing {
            return false
        }
        
        if self.commandWindowStatus == .should_close {
            self.close()
            
            return true
        }
            
        SoundEffectManager.play(.command)
        
        if self.commandType == .talk {
            self.commandWindowStatus = .processing
            
            let text1 = "そのほうこうには　だれも　いない。"
            
            self.mapMessageWindowNode = MapMessageWindowNode()
            self.mapMessageWindowNode.showMessages(
                scene: self,
                text1: text1,
                text2: nil,
                text3: nil,
                withSe: false,
                withNextMark: false,
                pointX: MapMessageWindowChildOfCommandWindowPointX,
                pointY: MapMessageWindowChildOfCommandWindowPointY,
                scale: 1,
                completion: {
                    self.commandWindowStatus = .should_close
                })
        }
        
        return false
    }
}
