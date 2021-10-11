//
//  AliahanTownSceneEvent.swift
//  DQ3
//
//  Created by aship on 2020/12/19.
//

import SpriteKit

extension AliahanTownScene {
    func motherAndHeroMove(completion: @escaping () -> Void) {
        let textureMotherUp = getCharacterTexture(direction: .up,
                                                  dqCharacter: .lady)
        let textureMotherRight = getCharacterTexture(direction: .right,
                                                     dqCharacter: .lady)
        let textureMotherLeft = getCharacterTexture(direction: .left,
                                                    dqCharacter: .lady)
        
        let actionMotherTextureUp = SKAction.setTexture(textureMotherUp)
        let actionMotherTextureLeft = SKAction.setTexture(textureMotherLeft)
        let actionMotherTextureRight = SKAction.setTexture(textureMotherRight)
        
        let textureHeroUp = getCharacterTexture(direction: .up,
                                                dqCharacter: .hero)
        let textureHeroRight = getCharacterTexture(direction: .right,
                                                   dqCharacter: .hero)
        
        let actionHeroTextureUp = SKAction.setTexture(textureHeroUp)
        let actionHeroTextureRight = SKAction.setTexture(textureHeroRight)
        
        let actionWait = SKAction.wait(forDuration: 1 / 4)
        
        let actionMother1 = SKAction.moveBy(x: -16,
                                            y: 0,
                                            duration: 1 / 4)
        
        let actionMother2 = SKAction.moveBy(x: 0,
                                            y: 16 * 6,
                                            duration: 1 / 4 * 6)
        
        let actionMother3 = SKAction.moveBy(x: 16 * 2,
                                            y: 0,
                                            duration: 1 / 4 * 2)
        
        let actionMother4 = SKAction.moveBy(x: 0,
                                            y: 16 * 3,
                                            duration: 1 / 4 * 3)
        
        let actionMother5 = SKAction.moveBy(x: 16 * 10,
                                            y: 0,
                                            duration: 1 / 4 * 10)
        
        let actionMother6 = SKAction.moveBy(x: 0,
                                            y: 16 * 7,
                                            duration: 1 / 4 * 7)
        
        let actionsMother = SKAction.sequence([actionWait,
                                               actionMotherTextureRight,
                                               actionWait,
                                               actionMotherTextureLeft,
                                               actionMother1,
                                               actionMotherTextureUp,
                                               actionMother2,
                                               actionMotherTextureRight,
                                               actionMother3,
                                               actionMotherTextureUp,
                                               actionMother4,
                                               actionMotherTextureRight,
                                               actionMother5,
                                               actionMotherTextureUp,
                                               actionMother6,
                                               actionMotherTextureLeft])
        let motherNode = self.motherNode
        
        motherNode.run(actionsMother,
                       completion: {})
        
        let actionHero1 = SKAction.moveBy(x: -16 * 2,
                                          y: 0,
                                          duration: 1 / 4 * 2)
        
        let actionHero2 = SKAction.moveBy(x: 0,
                                          y: 16 * 2,
                                          duration: 1 / 4 * 2)
        
        let actionShowMainTileMap = SKAction.run {
            self.showMainTileMap(color: self.greenBGColor)
        }
        
        let actionHero3 = SKAction.moveBy(x: 0,
                                          y: 16 * 4,
                                          duration: 1 / 4 * 4)
        
        let actionHero4 = SKAction.moveBy(x: 16 * 2,
                                          y: 0,
                                          duration: 1 / 4 * 2)
        
        let actionHero5 = SKAction.moveBy(x: 0,
                                          y: 16 * 3,
                                          duration: 1 / 4 * 3)
        
        let actionHero6 = SKAction.moveBy(x: 16 * 9,
                                          y: 0,
                                          duration: 1 / 4 * 9)
        
        let actionHero7 = SKAction.moveBy(x: 0,
                                          y: 16 * 7,
                                          duration: 1 / 4 * 7)
        
        let actionsHero = SKAction.sequence([actionWait,
                                             actionWait,
                                             actionHero1,
                                             actionHeroTextureUp,
                                             actionHero2,
                                             actionShowMainTileMap,
                                             actionHero3,
                                             actionHeroTextureRight,
                                             actionHero4,
                                             actionHeroTextureUp,
                                             actionHero5,
                                             actionHeroTextureRight,
                                             actionHero6,
                                             actionHeroTextureUp,
                                             actionHero7])
        let heroNode = self.heroNode
        
        heroNode.run(actionsHero,
                     completion: {
                        completion()
                     })
        
        let actionMap1 = SKAction.moveBy(x: 16 * 2 * self.scale,
                                         y: 0,
                                         duration: 1 / 4 * 2)
        
        let actionMap2 = SKAction.moveBy(x: 0,
                                         y: -16 * 6 * self.scale,
                                         duration: 1 / 4 * 6)
        
        let actionMap3 = SKAction.moveBy(x: -16 * 2 * self.scale,
                                         y: 0,
                                         duration: 1 / 4 * 2)
        
        let actionMap4 = SKAction.moveBy(x: 0,
                                         y: -16 * 3 * self.scale,
                                         duration: 1 / 4 * 3)
        
        let actionMap5 = SKAction.moveBy(x: -16 * 9 * self.scale,
                                         y: 0,
                                         duration: 1 / 4 * 9)
        
        let actionMap6 = SKAction.moveBy(x: 0,
                                         y: -16 * 7 * self.scale,
                                         duration: 1 / 4 * 7)
        
        let actionsMap = SKAction.sequence([actionWait,
                                            actionWait,
                                            actionMap1,
                                            actionMap2,
                                            actionMap3,
                                            actionMap4,
                                            actionMap5,
                                            actionMap6])
        self.mainTileMapNode.run(actionsMap,
                                 completion: {})
    }
}
