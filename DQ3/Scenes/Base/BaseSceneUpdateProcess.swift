//
//  BaseSceneUpdateProcess.swift
//  DQ3
//
//  Created by aship on 2020/12/28.
//

import SpriteKit

extension BaseScene {
    func processUpdate(padDirection: Direction,
                       tileMapNode: SKTileMapNode,
                       characterNodes: inout [CharacterNode],
                       queueFollowDirections: inout [Direction],
                       dqSceneType: DQSceneType,
                       scale: CGFloat,
                       checkCanMove: CheckCanMove?,
                       completion: @escaping (_ newPositionX: Int,
                                              _ newPositionY: Int) -> Void) {
        if self.fieldMoveMode == .walk &&
            self.ramiaDirection != .neutral {
            // ラーミアから降りたら、即座に neutral にする
            self.ramiaDirection = .neutral
            self.padDirection = .neutral
            
            return
        }
        
        if self.fieldMoveMode == .ramia {
            if padDirection == .neutral {
                if self.ramiaDirection != .neutral {
                    // auto 移動のため、padDirection 書き換え
                    self.padDirection = self.ramiaDirection
                }
            }
            else {
                if self.ramiaDirection == .neutral {
                    // ラーミア乗った瞬間は動かないが、
                    // 1歩でも動くと autoで動きだす
                    // 1歩でも動いたら方向をセット
                    self.ramiaDirection = padDirection
                }
                else if self.ramiaDirection != .neutral {
                    self.ramiaDirection = padDirection
                }
            }
        }
        
        if padDirection == .neutral {
            return
        }
        
        var headNode = characterNodes.first!
        
        if headNode.isMoving {
            return
        }
        
        if !headNode.isMovePermitted {
            return
        }
        
        headNode.changeDirection(direction: padDirection)
        
        let diffs = getDiffXY(direction: padDirection)
        
        let diffX = diffs.0
        let diffY = diffs.1
        
        let newPositionX = headNode.positionX + diffX
        let newPositionY = headNode.positionY + diffY
        
        if self.fieldMoveMode == .walk ||
            self.fieldMoveMode == .ship {
            let canMove = checkCanMove!(tileMapNode,
                                        newPositionX,
                                        newPositionY)
            if !canMove {
                return
            }
        }
        
        if self.fieldMoveMode == .walk {
            // NPC 衝突チェック
            let dqMapScene = getDQMapScene(dqSceneType: dqSceneType)!
            
            for characterNpcNode in dqMapScene.characterNpcNodes {
                if characterNpcNode.positionX == newPositionX &&
                    characterNpcNode.positionY == newPositionY {
                    return
                }
            }
        }
        
        // 船から出るときは、船を残して、先頭にキャラに変えてから移動
        if self.fieldMoveMode == .ship {
            var isLanding: Bool!
            
            if DataManager.adventureLog.dqSceneType == .field {
                isLanding = self.fieldScene?.checkLandingFromShip(tileMapNode: tileMapNode,
                                                                  newPositionX: newPositionX,
                                                                  newPositionY: newPositionY)
            }
            else if DataManager.adventureLog.dqSceneType == .alefgard {
                isLanding = self.alefgardScene?.checkLandingFromShip(tileMapNode: tileMapNode,
                                                                     newPositionX: newPositionX,
                                                                     newPositionY: newPositionY)
            }
            
            if isLanding! {
                queueFollowDirections = []
                
                if DataManager.adventureLog.dqSceneType == .field {
                    // 船を降りる処理
                    self.fieldScene?.processLandingFromShip(characterNodes: &characterNodes,
                                                            tileMapNode: tileMapNode,
                                                            scale: scale)
                }
                else if DataManager.adventureLog.dqSceneType == .alefgard {
                    // 船を降りる処理
                    self.alefgardScene?.processLandingFromShip(characterNodes: &characterNodes,
                                                               tileMapNode: tileMapNode,
                                                               scale: scale)
                }
            }
            else {
                // 降りない時は、船の座標を記録
                DataManager.shipPositionX = newPositionX
                DataManager.shipPositionY = newPositionY
                DataManager.shipDirection = padDirection
            }
        }
        
        // reload 必要
        headNode = characterNodes.first!
        
        headNode.isMoving = true
        headNode.move(direction: padDirection,
                      tileMapNode: tileMapNode,
                      withMoveMap: true,
                      scale: self.scale) {
            //     print("SET MOVING FALSE")
            headNode.isMoving = false
            
            completion(newPositionX,
                       newPositionY)
        }
        
        if 0 < queueFollowDirections.count {
            let direction = queueFollowDirections.last
            
            if 1 < characterNodes.count {
                let node = characterNodes[1]
                node.move(direction: direction!,
                          tileMapNode: tileMapNode,
                          withMoveMap: false,
                          scale: self.scale,
                          completion: {})
                node.changeDirection(direction: direction!)
            }
        }
        
        if 1 < queueFollowDirections.count {
            let indexLastMinusOne = queueFollowDirections.count - 2
            let direction = queueFollowDirections[indexLastMinusOne]
            
            if 2 < characterNodes.count {
                let node = characterNodes[2]
                node.move(direction: direction,
                          tileMapNode: tileMapNode,
                          withMoveMap: false,
                          scale: self.scale,
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
                          scale: self.scale,
                          completion: {})
                node.changeDirection(direction: direction)
            }
        }
        
        let characterNodesCount = characterNodes.count
        
        if 1 < characterNodesCount {
            // 2人目以降のために座標をキューに保存
            queueFollowDirections.append(padDirection)
            
            if queueFollowDirections.count == characterNodesCount {
                queueFollowDirections.removeFirst()
            }
        }
    }
}
