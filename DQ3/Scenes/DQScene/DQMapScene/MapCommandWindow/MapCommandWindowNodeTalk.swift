//
//  MapCommandWindowNodeTalk.swift
//  DQ3
//
//  Created by aship on 2021/04/20.
//

import SpriteKit

extension MapCommandWindowNode {
    internal func processTalkButtonA(dqSceneType: DQSceneType) {
        self.commandWindowStatus = .processing
        
        switch dqSceneType {
        case .aliahan_town: processTalkAliahanTownButtonA()
        case .aliahan_town_house: processTalkAliahanTownButtonA()
        default: processTalkDefaultButtonA()
        }
    }
    
    private func processTalkAliahanTownButtonA() {
        if let talkMessageWindowAliahanTown = self.talkMessageWindowAliahanTown{
            talkMessageWindowAliahanTown.processButtonA()
            
            return
        }
        
        pauseTriangleAnimation(triangleNode: self.triangleNode)
        SoundEffectManager.play(.command)
        
        self.talkMessageWindowAliahanTown = TalkMessageWindowNodeAliahanTown(characterNpcNodes: self.characterNpcNodes)
        self.talkMessageWindowAliahanTown?.addToNode(
            node: self,
            pointX: MapMessageWindowChildOfCommandWindowPointX,
            pointY: MapMessageWindowChildOfCommandWindowPointY,
            scale: 1)
        
        self.talkMessageWindowAliahanTown?.initializeTalk()
        self.talkMessageWindowAliahanTown?.processButtonA()
    }
    
    private func processTalkAliahanTownHouseButtonA() {
        if let talkMessageWindowAliahanTownHouse = self.talkMessageWindowAliahanTownHouse {
            talkMessageWindowAliahanTownHouse.processButtonA()
            
            return
        }
        
        pauseTriangleAnimation(triangleNode: self.triangleNode)
        SoundEffectManager.play(.command)
        
        self.talkMessageWindowAliahanTownHouse = TalkMessageWindowNodeAliahanTownHouse(characterNpcNodes: self.characterNpcNodes)
        self.talkMessageWindowAliahanTownHouse?.addToNode(
            node: self,
            pointX: MapMessageWindowChildOfCommandWindowPointX,
            pointY: MapMessageWindowChildOfCommandWindowPointY,
            scale: 1)
        
        self.talkMessageWindowAliahanTownHouse?.initializeTalk()
        self.talkMessageWindowAliahanTownHouse?.processButtonA()
    }
    
    private func processTalkDefaultButtonA() {
        pauseTriangleAnimation(triangleNode: self.triangleNode)
        SoundEffectManager.play(.command)
        
        self.baseTalkMessageWindowNode = BaseTalkMessageWindowNode(characterNpcNodes: self.characterNpcNodes)
        self.baseTalkMessageWindowNode?.addToNode(
            node: self,
            pointX: MapMessageWindowChildOfCommandWindowPointX,
            pointY: MapMessageWindowChildOfCommandWindowPointY,
            scale: 1)
        
        self.baseTalkMessageWindowNode?.processButtonA()
    }
}
