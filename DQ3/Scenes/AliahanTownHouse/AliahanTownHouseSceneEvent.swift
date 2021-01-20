//
//  AliahanTownHouseSceneEvent.swift
//  DQ3
//
//  Created by aship on 2020/12/19.
//

import SpriteKit

extension AliahanTownHouseScene {
    func motherMove(completion: @escaping () -> Void) {
        let textureMotherDown = getCharacterTexture(direction: .down,
                                                    dqCharacter: .lady)
        let textureMotherRight = getCharacterTexture(direction: .right,
                                                     dqCharacter: .lady)
        let textureMotherLeft = getCharacterTexture(direction: .left,
                                                    dqCharacter: .lady)
        
        let actionMotherTextureDown = SKAction.setTexture(textureMotherDown)
        let actionMotherTextureLeft = SKAction.setTexture(textureMotherLeft)
        let actionMotherTextureRight = SKAction.setTexture(textureMotherRight)
        
        let actionMove1 = SKAction.moveBy(x: -16 * 3,
                                          y: 0,
                                          duration: 1 / 4 * 3)
        
        let actionMove2 = SKAction.moveBy(x: 0,
                                          y: -16 * 3,
                                          duration: 1 / 4 * 3)
        
        let actionMove3 = SKAction.moveBy(x: 16 * 7,
                                          y: 0,
                                          duration: 1 / 4 * 7)
        
        let sequence = SKAction.sequence([actionMotherTextureLeft,
                                          actionMove1,
                                          actionMotherTextureDown,
                                          actionMove2,
                                          actionMotherTextureRight,
                                          actionMove3])
        let motherNode = self.motherNode
        
        motherNode.run(sequence,
                       completion: {
                        completion()
                       })
    }
    
    func motherAndHeroMoveCatchUp2(completion: @escaping () -> Void) {
        let actionMother = SKAction.moveBy(x: 16 * 1,
                                           y: 0,
                                           duration: 1 / 4 * 1)
        let motherNode = self.motherNode
        
        motherNode.run(actionMother,
                       completion: {})
        
        let actionHero = SKAction.moveBy(x: 16 * 2,
                                         y: 0,
                                         duration: 1 / 4 * 2)
        let heroNode = self.heroNode
        
        heroNode.run(actionHero,
                     completion: {
                        completion()
                     }
        )
    }
    
    func motherAndHeroMoveCatchUp1(completion: @escaping () -> Void) {
        let textureHeroUp = getCharacterTexture(direction: .up,
                                                dqCharacter: .hero)
        let textureHeroRight = getCharacterTexture(direction: .right,
                                                   dqCharacter: .hero)
        
        let actionHeroTextureUp = SKAction.setTexture(textureHeroUp)
        let actionHeroTextureRight = SKAction.setTexture(textureHeroRight)
        
        let actionMother = SKAction.moveBy(x: 16 * 1,
                                           y: 0,
                                           duration: 1 / 4 * 1)
        let motherNode = self.motherNode
        
        motherNode.run(actionMother,
                       completion: {})
        
        let actionHero1 = SKAction.moveBy(x: 0,
                                          y: 16,
                                          duration: 1 / 4 * 1)
        
        let actionHero2 = SKAction.moveBy(x: 16 * 2,
                                          y: 0,
                                          duration: 1 / 4 * 2)
        
        let actionsHero = SKAction.sequence([actionHeroTextureUp,
                                             actionHero1,
                                             actionHeroTextureRight,
                                             actionHero2])
        let heroNode = self.heroNode
        
        heroNode.run(actionsHero,
                     completion: {
                        completion()
                     }
        )
    }
}
