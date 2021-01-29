//
//  DQMapSceneButtonA.swift
//  DQ3
//
//  Created by aship on 2021/01/08.
//

import SpriteKit

extension DQMapScene {
    func processButtonA(mapCommandWindowNode: inout MapCommandWindowNode,
                        mapMessageWindowNode: inout MapMessageWindowNode,
                        scale: CGFloat) {
        let headNode = DataManager.characterNodes.first!
        
        if !mapCommandWindowNode.isOpen {
            // コマンドウィンドウ表示
            self.scene.playSoundEffect(.command)
            
            headNode.setMoveProhibited()
            
            for node in DataManager.characterNodes {
                node.isPaused = true
            }
            
            for node in self.characterNpcNodes {
                node.isPaused = true
            }
            
            mapCommandWindowNode = MapCommandWindowNode(characterNpcNodes: self.characterNpcNodes)
            mapCommandWindowNode.addToScene(scene: self.scene,
                                            scale: self.scene.scale)
        }
        else if mapCommandWindowNode.isOpen {
            // コマンド処理中
            let shouldClose = mapCommandWindowNode.processButtonA(headNode: headNode)
            
            if shouldClose {
                headNode.setMovePermitted()
                
                for node in DataManager.characterNodes {
                    node.isPaused = false
                }
                
                for node in self.characterNpcNodes {
                    node.isPaused = false
                }
            }
        }
    }
}
