//
//  AliahanTownHouseSceneEvent.swift
//  DQ3
//
//  Created by aship on 2020/12/19.
//

import SpriteKit

extension AliahanTownHouseScene {
    func motherMove(completion: @escaping () -> Void) {
        let actionMotherAnimationDown = getCharacterAnimationAction(direction: .down,
                                                                    dqCharacter: .lady)
        let actionMotherAnimationLeft = getCharacterAnimationAction(direction: .left,
                                                                    dqCharacter: .lady)
        let actionMotherAnimationRight = getCharacterAnimationAction(direction: .right,
                                                                     dqCharacter: .lady)
        let actionMove1 = SKAction.moveBy(x: -16 * 3,
                                          y: 0,
                                          duration: 1 / 4 * 3)
        
        let actionMove2 = SKAction.moveBy(x: 0,
                                          y: -16 * 3,
                                          duration: 1 / 4 * 3)
        
        let actionMove3 = SKAction.moveBy(x: 16 * 7,
                                          y: 0,
                                          duration: 1 / 4 * 7)
        
        let motherNode = self.characterNpcNodes.first!
        
        motherNode.run(actionMotherAnimationLeft)
        motherNode.run(actionMove1,
                       completion: {
                        motherNode.run(actionMotherAnimationDown)
                        motherNode.run(actionMove2,
                                       completion: {
                                        motherNode.run(actionMotherAnimationRight)
                                        motherNode.run(actionMove3,
                                                       completion: {
                                                        completion()
                                                       })
                                       })
                       })
    }
    
    func motherAndHeroMoveCatchUp2(completion: @escaping () -> Void) {
        let actionMother = SKAction.moveBy(x: 16 * 1,
                                           y: 0,
                                           duration: 1 / 4 * 1)
        
        let motherNode = self.characterNpcNodes.first!
        
        motherNode.run(actionMother,
                       completion: {})
        
        let actionHero = SKAction.moveBy(x: 16 * 2,
                                         y: 0,
                                         duration: 1 / 4 * 2)
        
        let heroNode = DataManager.characterNodes.first!
        
        heroNode.run(actionHero,
                     completion: {
                        completion()
                     }
        )
    }
    
    func motherAndHeroMoveCatchUp1(completion: @escaping () -> Void) {
        let actionHeroAnimationUp = getCharacterAnimationAction(direction: .up,
                                                                dqCharacter: .hero)
        let actionHeroAnimationRight = getCharacterAnimationAction(direction: .right,
                                                                   dqCharacter: .hero)
        let actionMother = SKAction.moveBy(x: 16 * 1,
                                           y: 0,
                                           duration: 1 / 4 * 1)
        
        let motherNode = self.characterNpcNodes.first!
        
        motherNode.run(actionMother,
                       completion: {})
        
        let actionHero1 = SKAction.moveBy(x: 0,
                                          y: 16,
                                          duration: 1 / 4 * 1)
        
        let actionHero2 = SKAction.moveBy(x: 16 * 2,
                                          y: 0,
                                          duration: 1 / 4 * 2)
        
        let heroNode = DataManager.characterNodes.first!
        
        heroNode.run(actionHeroAnimationUp)
        heroNode.run(actionHero1,
                     completion: {
                        heroNode.run(actionHeroAnimationRight)
                        heroNode.run(actionHero2,
                                     completion: {
                                        completion()
                                     })
                     })
    }
}
