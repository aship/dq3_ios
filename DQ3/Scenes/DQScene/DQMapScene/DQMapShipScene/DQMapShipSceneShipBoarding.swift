//
//  FieldSceneShipBoarding.swift
//  DQ3
//
//  Created by aship on 2021/03/31.
//

import SpriteKit

extension DQMapShipScene {
    internal func checkBoardingShip(newPositionX: Int,
                                    newPositionY: Int) -> Bool {
        let shipNode = self.shipNode
        
        if shipNode?.positionX == newPositionX &&
            shipNode?.positionY == newPositionY {
            return true
        }
        
        return false
    }
    
    internal func processBoardingShip(tileMapNode: SKTileMapNode,
                                      characterNodes: inout [CharacterNode],
                                      shipNode: CharacterNode,
                                      queueFollowDirections: inout [Direction],
                                      scale: CGFloat,
                                      newPositionX: Int,
                                      newPositionY: Int) {
        self.scene.fieldMoveMode = .ship
        
        let headNode = characterNodes.first!
        headNode.isHidden = true
        
        // 船を先頭にする
        characterNodes.insert(shipNode, at: 0)
        
        shipNode.setMoveProhibited()
        
        if 0 < queueFollowDirections.count {
            let direction = queueFollowDirections.last
            
            // 2人パーティ + 船で node数 3
            if 2 < characterNodes.count {
                // 船 1人目 2人目
                let node = characterNodes[2]
                
                // 2人目 2nd move
                node.move(direction: direction!,
                          tileMapNode: tileMapNode,
                          withMoveMap: false,
                          scale: scale,
                          completion: {
                            let partyCharacterNodes = DataManager.adventureLog.partyCharacterNodes
                            
                            // 2人パーティだったらここで終わり
                            if partyCharacterNodes.count == 3 {
                                shipNode.setMovePermitted()
                                
                                AudioManager.stop()
                                AudioManager.play(dqAudio: .ship)
                            }
                            
                            self.process3rdMove(characterNode: node,
                                                shipNode: shipNode,
                                                tileMapNode: tileMapNode,
                                                scale: scale)
                          })
                node.changeDirection(direction: direction!)
            }
        }
        
        if 1 < queueFollowDirections.count {
            let indexLastMinusOne = queueFollowDirections.count - 2
            let direction = queueFollowDirections[indexLastMinusOne]
            
            // 3人パーティ + 船で node数 4
            if 3 < characterNodes.count {
                // 船 1人目 2人目 3人目
                let node = characterNodes[3]
                
                // 3人目 2nd move
                node.move(direction: direction,
                          tileMapNode: tileMapNode,
                          withMoveMap: false,
                          scale: scale,
                          completion: {})
                node.changeDirection(direction: direction)
            }
        }
        
        if 2 < queueFollowDirections.count {
            let indexLastMinusTwo = queueFollowDirections.count - 3
            let direction = queueFollowDirections[indexLastMinusTwo]
            
            // 4人パーティ + 船で node数 5
            if 4 < characterNodes.count {
                // 船 1人目 2人目 3人目 4人目
                let node = characterNodes[4]
                
                // 4人目 2nd move
                node.move(direction: direction,
                          tileMapNode: tileMapNode,
                          withMoveMap: false,
                          scale: scale,
                          completion: {})
                node.changeDirection(direction: direction)
            }
        }
        
        // パーティ1人 + 船で node数 2
        if characterNodes.count == 2 {
            shipNode.setMovePermitted()
            
            AudioManager.stop()
            AudioManager.play(dqAudio: .ship)
        }
    }
    
    private func process3rdMove(characterNode: CharacterNode,
                                shipNode: CharacterNode,
                                tileMapNode: SKTileMapNode,
                                scale: CGFloat) {
        characterNode.isHidden = true
        
        let partyCharacterNodes = DataManager.adventureLog.partyCharacterNodes
        let queueFollowDirections = DataManager.queueFollowDirections
        
        if 0 < queueFollowDirections.count {
            let direction = queueFollowDirections.last!
            
            // パーティ3人 + 船で node数 4
            if 3 < partyCharacterNodes.count {
                // 船 1人目 2人目 3人目
                let node = partyCharacterNodes[3]
                
                // 3人目 3rd move
                node.move(direction: direction,
                          tileMapNode: tileMapNode,
                          withMoveMap: false,
                          scale: scale,
                          completion: {
                            node.isHidden = true
                            
                            // 3人だったらここで終わり
                            if partyCharacterNodes.count == 4 {
                                shipNode.setMovePermitted()
                                
                                AudioManager.stop()
                                AudioManager.play(dqAudio: .ship)
                            }
                            
                            self.process4thMove(partyCharacterNodes: partyCharacterNodes,
                                                queueFollowDirections: queueFollowDirections,
                                                shipNode: shipNode,
                                                tileMapNode: tileMapNode,
                                                scale: scale)
                          })
                node.changeDirection(direction: direction)
            }
        }
        
        if 1 < queueFollowDirections.count {
            let indexLastMinusTwo = queueFollowDirections.count - 2
            let direction = queueFollowDirections[indexLastMinusTwo]
            
            // パーティ4人 + 船で node数 5
            if 4 < partyCharacterNodes.count {
                // 船 1人目 2人目 3人目 4人目
                let node = partyCharacterNodes[4]
                
                // 4人目 3rd move
                node.move(direction: direction,
                          tileMapNode: tileMapNode,
                          withMoveMap: false,
                          scale: scale,
                          completion: {})
                node.changeDirection(direction: direction)
            }
        }
    }
    
    private func process4thMove(partyCharacterNodes: [CharacterNode],
                                queueFollowDirections: [Direction],
                                shipNode: CharacterNode,
                                tileMapNode: SKTileMapNode,
                                scale: CGFloat) {
        let direction = queueFollowDirections.last
        
        // パーティ4人 + 船で node数 5
        if 4 < partyCharacterNodes.count {
            // 船 1人目 2人目 3人目 4人目
            let node = partyCharacterNodes[4]
            
            // 4人目 4th move
            node.move(direction: direction!,
                      tileMapNode: tileMapNode,
                      withMoveMap: false,
                      scale: scale,
                      completion: {
                        node.isHidden = true
                        
                        shipNode.setMovePermitted()
                        
                        AudioManager.stop()
                        AudioManager.play(dqAudio: .ship)
                      })
            node.changeDirection(direction: direction!)
        }
    }
}
