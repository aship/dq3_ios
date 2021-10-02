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
            let action = getCharacterAnimationAction(direction: .left,
                                                     dqCharacter: .hero)
            self.heroNode.run(action)
        }
        else {
            let action = getCharacterAnimationAction(direction: .right,
                                                     dqCharacter: .hero)
            self.heroNode.run(action)
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
