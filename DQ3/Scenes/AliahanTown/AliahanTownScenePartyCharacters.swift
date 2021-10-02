//
//  AliahanTownScenePartyCharacters.swift
//  DQ3
//
//  Created by aship on 2021/01/07.
//

import SpriteKit

extension AliahanTownScene {
    func addPartyCharacters(tileMapNode: SKTileMapNode,
                            scale: CGFloat) {
        addCharacter(node: self.heroNode,
                     tileMapNode: tileMapNode,
                     isTown: true)
        
        if dqStory == .opening {
            let texture = getCharacterTexture(direction: .left,
                                              dqCharacter: .hero)
            self.heroNode.texture = texture
        }
        else {
            let texture = getCharacterTexture(direction: .right,
                                              dqCharacter: .hero)
            self.heroNode.texture = texture
        }
        
        setCharacterHeroPosition(positionX: self.heroPositionX,
                                 positionY: self.heroPositionY,
                                 node: self.heroNode,
                                 tileMapNode: tileMapNode,
                                 scale: scale)
        
        setMapPosition(positionX: self.heroPositionX,
                       positionY: self.heroPositionY,
                       tileMapNode: tileMapNode,
                       scale: scale)
    }
}
