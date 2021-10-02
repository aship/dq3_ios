//
//  MapCommandWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/01/21.
//

import SpriteKit

extension MapCommandWindowNode {
    func processButtonA() -> Bool {
        pauseTriangleAnimation(triangleNode: self.triangleNode)
        
        if self.commandWindowStatus == .processing {
            return false
        }
        
        if self.commandWindowStatus == .should_close {
            self.removeFromParent()
            
            return true
        }
        
        SoundEffectManager.play(.command)
        
        if self.commandType == .talk {
            self.commandWindowStatus = .processing
            
            let text1 = "そのほうこうには　だれも　いない。"
            
            self.mapMessageWindowNode = MapMessageWindowNode()
            self.mapMessageWindowNode?.addToScene(
                node: self,
                pointX: MapMessageWindowChildOfCommandWindowPointX,
                pointY: MapMessageWindowChildOfCommandWindowPointY,
                scale: 1)
            
            self.mapMessageWindowNode?.showMessages(
                text1: text1,
                text2: nil,
                text3: nil,
                withSe: false,
                withNextMark: false,
                completion: {
                    self.commandWindowStatus = .should_close
                })
        }
        else if self.commandType == .spells {
            self.commandWindowStatus = .processing
            
            let text1 = "じゅもんを　おぼえて　いない。"
            
            self.mapMessageWindowNode = MapMessageWindowNode()
            self.mapMessageWindowNode?.addToScene(
                node: self,
                pointX: MapMessageWindowChildOfCommandWindowPointX,
                pointY: MapMessageWindowChildOfCommandWindowPointY,
                scale: 1)
            
            self.mapMessageWindowNode?.showMessages(
                text1: text1,
                text2: nil,
                text3: nil,
                withSe: false,
                withNextMark: false,
                completion: {
                    self.commandWindowStatus = .should_close
                })
        }
        else if self.commandType == .status {
            self.commandWindowStatus = .processing
            
            let text1 = "＊「えにくすは　もう"
            let text2 = "じゅうぶんに　つよい！"
            
            self.mapMessageWindowNode = MapMessageWindowNode()
            self.mapMessageWindowNode?.addToScene(
                node: self,
                pointX: MapMessageWindowChildOfCommandWindowPointX,
                pointY: MapMessageWindowChildOfCommandWindowPointY,
                scale: 1)
            
            self.mapMessageWindowNode?.showMessages(
                text1: text1,
                text2: text2,
                text3: nil,
                withSe: false,
                withNextMark: false,
                completion: {
                    self.commandWindowStatus = .should_close
                })
        }
        else if self.commandType == .items {
            self.commandWindowStatus = .processing
            
            let text1 = "どうぐを　もっていない。"
            
            self.mapMessageWindowNode = MapMessageWindowNode()
            self.mapMessageWindowNode?.addToScene(
                node: self,
                pointX: MapMessageWindowChildOfCommandWindowPointX,
                pointY: MapMessageWindowChildOfCommandWindowPointY,
                scale: 1)
            
            self.mapMessageWindowNode?.showMessages(
                text1: text1,
                text2: nil,
                text3: nil,
                withSe: false,
                withNextMark: false,
                completion: {
                    self.commandWindowStatus = .should_close
                })
        }
        else if self.commandType == .equip {
            self.commandWindowStatus = .processing
            
            let text1 = "そうびするものを　もっていない。"
            
            self.mapMessageWindowNode = MapMessageWindowNode()
            self.mapMessageWindowNode?.addToScene(
                node: self,
                pointX: MapMessageWindowChildOfCommandWindowPointX,
                pointY: MapMessageWindowChildOfCommandWindowPointY,
                scale: 1)
            
            self.mapMessageWindowNode?.showMessages(
                text1: text1,
                text2: nil,
                text3: nil,
                withSe: false,
                withNextMark: false,
                completion: {
                    self.commandWindowStatus = .should_close
                })
        }
        else if self.commandType == .search {
            self.commandWindowStatus = .processing
            
            // text1 = "えにくすは　あしもとを　しらべた。"
            // ▼
            let text1 = "しかし　なにも　みつからなかった！"
            
            self.mapMessageWindowNode = MapMessageWindowNode()
            self.mapMessageWindowNode?.addToScene(
                node: self,
                pointX: MapMessageWindowChildOfCommandWindowPointX,
                pointY: MapMessageWindowChildOfCommandWindowPointY,
                scale: 1)
            
            self.mapMessageWindowNode?.showMessages(
                text1: text1,
                text2: nil,
                text3: nil,
                withSe: false,
                withNextMark: false,
                completion: {
                    self.commandWindowStatus = .should_close
                })
        }
        
        return false
    }
}
