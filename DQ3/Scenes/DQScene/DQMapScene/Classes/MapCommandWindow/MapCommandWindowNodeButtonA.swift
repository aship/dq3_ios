//
//  MapCommandWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/01/21.
//

import SpriteKit

extension MapCommandWindowNode {
    func processButtonA(headNode: CharacterNode) -> Bool {
        print("4444444")
        
        pauseTriangleAnimation(triangleNode: self.triangleNode)
        
        if self.commandWindowStatus == .processing {
            return false
        }
        
        if self.commandWindowStatus == .should_close {
            self.close()
            
            return true
        }
        
        print("BBBBBB")
        
        if self.isTalkMessageWindowOpen {
            self.commandWindowStatus = .processing
            
            if DataManager.dqSceneType == .aliahan_town {
                self.talkMessageWindowAliahanTown.processButtonA()
            }
            else if DataManager.dqSceneType == .aliahan_town_house {
                self.talkMessageWindowAliahanTownHouse.processButtonA()
            }
            
            return false
        }
        
        if self.mapCommandWhoWindowNode.isOpen {
            self.mapCommandWhoWindowNode.processButtonA()
            
            return false
        }
        
        
        
        SoundEffectManager.play(.command)
        
        if self.commandType == .talk {
            self.commandWindowStatus = .processing
            
            self.isTalkMessageWindowOpen = true
            
            if DataManager.dqSceneType == .aliahan_town {
                self.talkMessageWindowAliahanTown = TalkMessageWindowAliahanTown(characterNpcNodes: self.characterNpcNodes)
                self.talkMessageWindowAliahanTown.parentNode = self
                self.talkMessageWindowAliahanTown.addToScene(
                    node: self,
                    pointX: MapMessageWindowChildOfCommandWindowPointX,
                    pointY: MapMessageWindowChildOfCommandWindowPointY,
                    scale: 1)
                
                self.talkMessageWindowAliahanTown.processButtonA()
            }
            else if DataManager.dqSceneType == .aliahan_town_house {
                self.talkMessageWindowAliahanTownHouse = TalkMessageWindowAliahanTownHouse(characterNpcNodes: self.characterNpcNodes)
                self.talkMessageWindowAliahanTownHouse.parentNode = self
                self.talkMessageWindowAliahanTownHouse.addToScene(
                    node: self,
                    pointX: MapMessageWindowChildOfCommandWindowPointX,
                    pointY: MapMessageWindowChildOfCommandWindowPointY,
                    scale: 1)
                
                self.talkMessageWindowAliahanTownHouse.processButtonA()
            }
            
            
            // ここをもしかしたら、もう個別クラスにしたほうがいいっっぽい。
            
            
        }
        else if self.commandType == .spells {
            self.mapCommandWhoWindowNode = MapCommandWhoWindowNode()
            self.mapCommandWhoWindowNode.addToWindow(windowNode: self,
                                                     scale: 1)
            
            
            //            processSpell(mapCommandWindowNode: mapCommandWindowNode,
            //                         mapMessageWindowNode: &mapMessageWindowNode,
            //                         triangleNode: triangleNode,
            //                         isCommandWindowOpen: isCommandWindowOpen,
            //                         isCommandWhoWindowOpen: self.isCommandWhoWindowOpen,
            //                         isCommandSpellWindowOpen: self.isCommandSpellWindowOpen,
            //                         isCommandZoomWindowOpen: self.isCommandZoomWindowOpen,
            //                         scale: scale)
        }
        else if self.commandType == .status {
            self.commandWindowStatus = .processing
            
            let text1 = "＊「えにくすは　もう"
            let text2 = "じゅうぶんに　つよい！"
            
            self.mapMessageWindowNode = MapMessageWindowNode()
            self.mapMessageWindowNode.showMessages(
                scene: self,
                text1: text1,
                text2: text2,
                text3: nil,
                withSe: false,
                withNextMark: false,
                pointX: MapMessageWindowChildOfCommandWindowPointX,
                pointY: MapMessageWindowChildOfCommandWindowPointY,
                scale: 1,
                completion: {
                    self.commandWindowStatus = .should_close
                })
        }
        else if self.commandType == .items {
            self.commandWindowStatus = .processing
            
            let text1 = "どうぐを　もっていない"
            
            self.mapMessageWindowNode = MapMessageWindowNode()
            self.mapMessageWindowNode.showMessages(
                scene: self,
                text1: text1,
                text2: nil,
                text3: nil,
                withSe: false,
                withNextMark: false,
                pointX: MapMessageWindowChildOfCommandWindowPointX,
                pointY: MapMessageWindowChildOfCommandWindowPointY,
                scale: 1,
                completion: {
                    self.commandWindowStatus = .should_close
                })
        }
        else if self.commandType == .equip {
            self.commandWindowStatus = .processing
            
            let text1 = "そうびするものを　もっていない"
            
            self.mapMessageWindowNode = MapMessageWindowNode()
            self.mapMessageWindowNode.showMessages(
                scene: self,
                text1: text1,
                text2: nil,
                text3: nil,
                withSe: false,
                withNextMark: false,
                pointX: MapMessageWindowChildOfCommandWindowPointX,
                pointY: MapMessageWindowChildOfCommandWindowPointY,
                scale: 1,
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
            self.mapMessageWindowNode.showMessages(
                scene: self,
                text1: text1,
                text2: nil,
                text3: nil,
                withSe: false,
                withNextMark: false,
                pointX: MapMessageWindowChildOfCommandWindowPointX,
                pointY: MapMessageWindowChildOfCommandWindowPointY,
                scale: 1,
                completion: {
                    self.commandWindowStatus = .should_close
                })
        }
        
        return false
    }
}
