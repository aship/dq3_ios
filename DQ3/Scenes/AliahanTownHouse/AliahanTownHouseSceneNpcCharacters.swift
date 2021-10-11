//
//  AliahanTownHouseSceneNpcCharacters.swift
//  DQ3
//
//  Created by aship on 2021/01/07.
//

import SpriteKit

extension AliahanTownHouseScene {
    func addNpcCharacters(tileMapNode: SKTileMapNode,
                          scale: CGFloat) {
        addMother(tileMapNode: tileMapNode,
                  scale: scale)
    }
    
    private func addMother(tileMapNode: SKTileMapNode,
                           scale: CGFloat) {
        addCharacter(node: self.motherNode,
                     tileMapNode: tileMapNode,
                     isTown: true)
        
        if dqStory != .opening {
            let texture = getCharacterTexture(direction: .up,
                                              dqCharacter: .lady)
            self.motherNode.texture = texture
        }
        
        setCharacterNpcPosition(positionX: AliahanTownHouseMotherPositionX,
                                positionY: AliahanTownHouseMotherPositionY,
                                node: self.motherNode,
                                tileMapNode: tileMapNode,
                                scale: scale)
    }
}
