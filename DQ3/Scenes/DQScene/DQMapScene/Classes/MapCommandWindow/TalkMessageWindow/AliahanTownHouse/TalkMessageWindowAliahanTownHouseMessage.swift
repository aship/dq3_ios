//
//  TalkMessageWindowAliahanTownHouseMessage.swift
//  DQ3
//
//  Created by aship on 2021/01/29.
//

import SpriteKit

extension TalkMessageWindowAliahanTownHouse {
    func addToScene<T: SKNode>(node: T,
                               pointX: Int,
                               pointY: Int,
                               scale: CGFloat) {
        self.removeFromParent()
        
        let tileGroups = getTileGroups()
        let tileSet = SKTileSet(tileGroups: tileGroups)
        let size8 = CGSize(width: 8, height: 8)
        
        let numberOfColumns = 20
        let numberOfRows = 10
        
        self.tileSet = tileSet
        self.numberOfColumns = numberOfColumns
        self.numberOfRows = numberOfRows
        self.tileSize = size8
        
        setWindow(tileMapNode: self,
                  numberOfColumns: numberOfColumns,
                  numberOfRows: numberOfRows,
                  tileSet: tileSet)
        
        self.setScale(scale)
        self.zPosition = ZPositionWindow
        self.anchorPoint = CGPoint(x: 0, y: 1)
        self.position = CGPoint(x: CGFloat(pointX) * scale,
                                y: CGFloat(pointY) * scale)
        node.addChild(self)
    }
    
    func showMessages<T: SKNode>(scene: T,
                                 text1: String,
                                 text2: String?,
                                 text3: String?,
                                 withSe: Bool,
                                 withNextMark: Bool,
                                 pointX: Int,
                                 pointY: Int,
                                 scale: CGFloat,
                                 completion: @escaping () -> Void) {
        showMessage(string: text1,
                    line: 0,
                    withSe: withSe,
                    completion: {
                        if text2 == nil {
                            if withNextMark {
                                self.showNextMark(line: 1)
                            }
                            
                            completion()
                        }
                        else {
                            self.showMessage(string: text2!,
                                             line: 1,
                                             withSe: withSe,
                                             completion: {
                                                if text3 == nil {
                                                    if withNextMark {
                                                        self.showNextMark(line: 2)
                                                    }
                                                    
                                                    completion()
                                                }
                                                else {
                                                    self.showMessage(string: text3!,
                                                                     line: 2,
                                                                     withSe: withSe,
                                                                     completion: {
                                                                        if withNextMark {
                                                                            self.showNextMark(line: 3)
                                                                        }
                                                                        completion()
                                                                     })
                                                }
                                             })
                        }
                    })
    }
    
    func showMessage(string: String,
                     line: Int,
                     withSe: Bool,
                     completion: @escaping () -> Void) {
        let BaseX = 8
        let BaseY = -24 - 16 * line
        
        if withSe {
            SoundEffectManager.play(.message)
        }
        
        var arrLine: [SKSpriteNode] = []
        var actions: [SKAction] = []
        
        for (index, letter) in string.enumerated() {
            let node = DQFont.getFont(string: String(letter))
            node.position = CGPoint(x: BaseX + 8 * index,
                                    y: BaseY)
            node.alpha = 0
            self.addChild(node)
            
            arrLine.append(node)
            
            let actionFaceIn = SKAction.run({
                node.alpha = 1
            })
            
            let actionWait = SKAction.wait(forDuration: 1 / 32)
            
            actions.append(actionFaceIn)
            actions.append(actionWait)
        }
        
        self.arrLines.append(arrLine)
        
        let sequence = SKAction.sequence(actions)
        
        self.run(sequence,
                 completion: {
                    completion()
                 })
    }
}
