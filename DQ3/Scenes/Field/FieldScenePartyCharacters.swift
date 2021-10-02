//
//  FieldScenePartyCharacters.swift
//  DQ3
//
//  Created by aship on 2021/01/07.
//

import SpriteKit

extension FieldScene {
    func addPartyCharacters(tileMapNode: SKTileMapNode,
                            scale: CGFloat) {
        addCharacter(node: self.heroNode,
                     tileMapNode: tileMapNode,
                     isTown: false)
        
        let action = getCharacterAnimationAction(direction: .down,
                                                 dqCharacter: .hero)
        self.heroNode.run(action)
        
        setCharacterHeroPosition(positionX: self.heroPositionX,
                                 positionY: self.heroPositionY,
                                 node: self.heroNode,
                                 tileMapNode: tileMapNode,
                                 scale: scale)
        
        setMapPosition(positionX: self.heroPositionX,
                       positionY: self.heroPositionY,
                       tileMapNode: tileMapNode,
                       scale: scale)
        
        addCharacter(node: self.warriorNode,
                     tileMapNode: tileMapNode,
                     isTown: false)
        
        let action2 = getCharacterAnimationAction(direction: .down,
                                                  dqCharacter: .warrior_female)
        self.warriorNode.run(action2)
        
        setCharacterNpcPosition(positionX: self.heroPositionX,
                                positionY: self.heroPositionY,
                                node: self.warriorNode,
                                tileMapNode: tileMapNode,
                                scale: scale)
        
        addCharacter(node: self.priestNode,
                     tileMapNode: tileMapNode,
                     isTown: false)
        
        let action3 = getCharacterAnimationAction(direction: .down,
                                                  dqCharacter: .priest_female)
        
        self.priestNode.run(action3)
        
        setCharacterNpcPosition(positionX: self.heroPositionX,
                                positionY: self.heroPositionY,
                                node: self.priestNode,
                                tileMapNode: tileMapNode,
                                scale: scale)
        
        addCharacter(node: self.mageNode,
                     tileMapNode: tileMapNode,
                     isTown: false)
        
        let action4 = getCharacterAnimationAction(direction: .down,
                                                  dqCharacter: .mage_female)
        
        self.mageNode.run(action4)
        
        setCharacterNpcPosition(positionX: self.heroPositionX,
                                positionY: self.heroPositionY,
                                node: self.mageNode,
                                tileMapNode: tileMapNode,
                                scale: scale)
        
        self.heroNode.zPosition = 4
        self.warriorNode.zPosition = 3
        self.priestNode.zPosition = 2
        self.mageNode.zPosition = 1
    }
}
