//
//  AliahanTownHouseScenePartyCharacters.swift
//  DQ3
//
//  Created by aship on 2021/01/07.
//

import SpriteKit

extension AliahanTownHouseScene {
    func addPartyCharacters(tileMapNode: SKTileMapNode,
                            scale: CGFloat) {
        addCharacter(node: self.heroNode,
                     tileMapNode: tileMapNode,
                     isTown: true)
        
        if dqStory == .opening {
            self.heroNode.texture = SKTexture(imageNamed: "character/vocation/hero/sleep")
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
