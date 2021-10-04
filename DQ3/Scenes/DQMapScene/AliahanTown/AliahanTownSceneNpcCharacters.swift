//
//  AliahanTownSceneNpcCharacters.swift
//  DQ3
//
//  Created by aship on 2021/01/07.
//

import SpriteKit

extension AliahanTownScene {
    func addNpcCharacters(tileMapNode: SKTileMapNode,
                          dqStory: DQStory,
                          scale: CGFloat) {
        addMother(tileMapNode: tileMapNode,
                  dqStory: dqStory,
                  scale: scale)
    }
    
    private func addMother(tileMapNode: SKTileMapNode,
                           dqStory: DQStory,
                           scale: CGFloat) {
        if DQStory.mother_waiting.rawValue < dqStory.rawValue {
            return
        }
        
        let motherNode = CharacterNode(dqCharacter: .lady)
        
        motherNode.addToMap(tileMapNode: tileMapNode,
                            isTown: true)
        
        if dqStory == .opening {
            motherNode.positionX = AliahanTownMotherStartPositionX
            motherNode.positionY = AliahanTownMotherStartPositionY
            
            motherNode.initDirection(direction: .left)
        }
        else if dqStory == .mother_waiting {
            motherNode.positionX = AliahanTownMotherWaitingPositionX
            motherNode.positionY = AliahanTownMotherWaitingPositionY
            
            motherNode.initDirection(direction: .up)
        }
        
        motherNode.zPosition = 1
        motherNode.setPosition(tileMapNode: tileMapNode,
                               withMoveMap: false,
                               scale: scale)
        
        self.characterNpcNodes.append(motherNode)
    }
}
