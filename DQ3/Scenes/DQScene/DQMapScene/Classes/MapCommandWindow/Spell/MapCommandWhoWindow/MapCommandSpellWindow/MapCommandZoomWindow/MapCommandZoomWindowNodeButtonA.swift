//
//  MapCommandZoomWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/01/22.
//

import SpriteKit

extension MapCommandZoomWindowNode {
    func processButtonA() {
        if self.isProcessing {
            return
        }
        
        SoundEffectManager.play(.command)
        
        if self.dqZoom == .next_page {
            self.page += 1
            
            if self.page == 4 {
                self.page = 0
            }
            
            self.delegate!.doSomething(page: self.page)
            
            return
        }
        
        pauseTriangleAnimation(triangleNode: self.triangleNode)
        
        self.isProcessing = true
        let text1 = "ルーラをとなえた！！"
        
        self.mapMessageWindowNode = MapMessageWindowNode()
        self.mapMessageWindowNode.showMessages(
            scene: self,
            text1: text1,
            text2: nil,
            text3: nil,
            withSe: false,
            withNextMark: false,
            pointX: MapMessageWindowChildOfZoomPointX,
            pointY: MapMessageWindowChildOfZoomPointY,
            scale: 1,
            completion: {})
        
        DataManager.queueFollowDirections = []
        
        let values = getZoomPosition(dqZoom: self.dqZoom)
        
        let positionX = values.0
        let positionY = values.1
        
        
        print("GOTO \(self.dqZoom)")
        
        
        for node in DataManager.characterNodes {
            node.positionX = positionX
            node.positionY = positionY
            node.direction = .down
        }
        
        if self.dqZoom == .tantegel ||
            self.dqZoom == .damdara ||
            self.dqZoom == .cantlin ||
            self.dqZoom == .kol ||
            self.dqZoom == .rimuldar {
            // temporary アレフガルド
            DataManager.scene.transitionToMapWithZoom(dqSceneType: .alefgard,
                                                      dqAudio: .alefgard)
        }
        else {
            DataManager.scene.transitionToMapWithZoom(dqSceneType: .field,
                                                      dqAudio: .field)
        }
    }
}
