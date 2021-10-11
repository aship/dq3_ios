//
//  AliahanTownHouseSceneNpcCharacters.swift
//  DQ3
//
//  Created by aship on 2021/01/07.
//

import SpriteKit

extension AliahanTownHouseScene {
    func addNpcCharacters(tileMapNode: SKTileMapNode,
                          dqStory: DQStory,
                          scale: CGFloat) {
        addMother(tileMapNode: tileMapNode,
                  scale: scale)
    }
    
    private func addMother(tileMapNode: SKTileMapNode,
                           scale: CGFloat) {
        let motherNode = CharacterNode(dqCharacter: .lady)
        motherNode.addToMap(tileMapNode: tileMapNode,
                            isTown: true)
        
        motherNode.positionX = AliahanTownHouseMotherPositionX
        motherNode.positionY = AliahanTownHouseMotherPositionY
        
        if DataManager.dqStory == .opening {
            motherNode.initDirection(direction: .down)
        }
        else {
            motherNode.initDirection(direction: .up)
        }
        
        motherNode.setPosition(tileMapNode: tileMapNode,
                               withMoveMap: false,
                               scale: scale)
        
        self.characterNpcNodes.append(motherNode)
    }
}
