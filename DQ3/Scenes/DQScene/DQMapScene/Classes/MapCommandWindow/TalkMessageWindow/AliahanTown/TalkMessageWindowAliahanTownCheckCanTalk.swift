//
//  AliahanTownSceneCheckCanTalk.swift
//  DQ3
//
//  Created by aship on 2021/01/09.
//

import SpriteKit

extension TalkMessageWindowAliahanTown {
    func checkCanTalk(positionX: Int,
                      positionY: Int,
                      direction: Direction) -> (Bool, String) {
        let headNode = DataManager.characterNodes.first!
        
        let diffs = getDiffXY(direction: headNode.direction)
        
        let diffX = diffs.0
        let diffY = diffs.1
        
        let newPositionX = headNode.positionX + diffX
        let newPositionY = headNode.positionY + diffY
        
        for characterNode in self.characterNpcNodes {
            if characterNode.positionX == newPositionX &&
                characterNode.positionY == newPositionY {
                let name = characterNode.name!
                
                return (true, name)
            }
        }
        
        return (false, "")
    }
}
