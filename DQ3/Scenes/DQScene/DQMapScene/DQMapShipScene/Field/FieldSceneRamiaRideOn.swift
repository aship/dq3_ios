//
//  FieldSceneRamiaRideOn.swift
//  DQ3
//
//  Created by aship on 2021/04/25.
//

import SpriteKit

extension FieldScene {    
    func processRideOnRamia(tileMapNode: SKTileMapNode,
                            ramiaNode: CharacterNode,
                            fieldMoveMode: inout FieldMoveMode,
                            characterNodes: inout [CharacterNode],
                            queueFollowDirections: [Direction],
                            scale: CGFloat) {
        fieldMoveMode = .ramia
        
        let headNode = characterNodes.first!
        headNode.isHidden = true
        
        ramiaNode.setMoveProhibited()
        
        if characterNodes.count == 1 ||
            queueFollowDirections.count == 0 {
            // ラーミアに降りてすぐ乗った時に
            // パーティが2人以上のとき必要な処理
            for node in characterNodes {
                node.isHidden = true
            }
            
            // 先頭を無理やりラーミアにする
            characterNodes.insert(ramiaNode, at: 0)
            ramiaNode.setMovePermitted()
            
            AudioManager.stop()
            AudioManager.play(dqAudio: .ramia)
            
            return
        }
        
        let direction = queueFollowDirections.last
        let node = characterNodes[1]
        
        // 2nd character move
        node.move(direction: direction!,
                  tileMapNode: tileMapNode,
                  withMoveMap: false,
                  scale: scale,
                  completion: {
                    node.isHidden = true
                    
                    let characterNodes = DataManager.adventureLog.partyCharacterNodes
                    
                    if characterNodes.count == 2 {
                        // 先頭を無理やりラーミアにする
                        DataManager.adventureLog.partyCharacterNodes.insert(ramiaNode, at: 0)
                        ramiaNode.setMovePermitted()
                        
                        AudioManager.stop()
                        AudioManager.play(dqAudio: .ramia)
                        
                        return
                    }
                    
                    self.process3rdCharacterMove(partyCharacterNodes: DataManager.adventureLog.partyCharacterNodes,
                                                 queueFollowDirections: queueFollowDirections,
                                                 ramiaNode: ramiaNode,
                                                 tileMapNode: tileMapNode,
                                                 scale: scale)
                  })
        
        node.changeDirection(direction: direction!)
        
        if 1 < queueFollowDirections.count {
            let indexLastMinusOne = queueFollowDirections.count - 2
            let direction = queueFollowDirections[indexLastMinusOne]
            
            if 2 < characterNodes.count {
                let node = characterNodes[2]
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
            
            if 3 < characterNodes.count {
                let node = characterNodes[3]
                node.move(direction: direction,
                          tileMapNode: tileMapNode,
                          withMoveMap: false,
                          scale: scale,
                          completion: {})
                node.changeDirection(direction: direction)
            }
        }
    }
    
    private func process3rdCharacterMove(partyCharacterNodes: [CharacterNode],
                                         queueFollowDirections: [Direction],
                                         ramiaNode: CharacterNode,
                                         tileMapNode: SKTileMapNode,
                                         scale: CGFloat) {
        let direction = queueFollowDirections.last
        
        if 2 < partyCharacterNodes.count {
            let node = partyCharacterNodes[2]
            
            node.move(direction: direction!,
                      tileMapNode: tileMapNode,
                      withMoveMap: false,
                      scale: scale,
                      completion: {
                        node.isHidden = true
                        
                        if partyCharacterNodes.count == 3 {
                            // 先頭を無理やりラーミアにする
                            DataManager.adventureLog.partyCharacterNodes.insert(ramiaNode, at: 0)
                            ramiaNode.setMovePermitted()
                            
                            AudioManager.stop()
                            AudioManager.play(dqAudio: .ramia)
                            
                            return
                        }
                        
                        self.process4thCharacterMove(partyCharacterNodes: DataManager.adventureLog.partyCharacterNodes,
                                                     queueFollowDirections: queueFollowDirections,
                                                     ramiaNode: ramiaNode,
                                                     tileMapNode: tileMapNode,
                                                     scale: scale)
                      })
            
            node.changeDirection(direction: direction!)
        }
        
        if 1 < queueFollowDirections.count {
            let indexLastMinusTwo = queueFollowDirections.count - 2
            let direction = queueFollowDirections[indexLastMinusTwo]
            
            if 3 < partyCharacterNodes.count {
                let node = partyCharacterNodes[3]
                node.move(direction: direction,
                          tileMapNode: tileMapNode,
                          withMoveMap: false,
                          scale: scale,
                          completion: {})
                node.changeDirection(direction: direction)
            }
        }
    }
    
    private func process4thCharacterMove(partyCharacterNodes: [CharacterNode],
                                         queueFollowDirections: [Direction],
                                         ramiaNode: CharacterNode,
                                         tileMapNode: SKTileMapNode,
                                         scale: CGFloat) {
        if 0 < queueFollowDirections.count {
            let direction = queueFollowDirections.last
            
            if 3 < partyCharacterNodes.count {
                let node = partyCharacterNodes[3]
                
                node.move(direction: direction!,
                          tileMapNode: tileMapNode,
                          withMoveMap: false,
                          scale: scale,
                          completion: {
                            node.isHidden = true
                            
                            // 先頭を無理やりラーミアにする
                            DataManager.adventureLog.partyCharacterNodes.insert(ramiaNode, at: 0)
                            ramiaNode.setMovePermitted()
                            
                            AudioManager.stop()
                            AudioManager.play(dqAudio: .ramia)
                          })
                
                node.changeDirection(direction: direction!)
            }
        }
    }
}
