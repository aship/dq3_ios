//
//  OpeningScene.swift
//  DQ3
//
//  Created by aship on 2020/12/19.
//

import SpriteKit

class OpeningScene: DQMapScene {
    enum SceneFlag {
        case message_1_start
        case message_1_end
        case message_2_start
        case message_2_end
        case transition
    }
    
    var sceneFlag: SceneFlag = .message_1_start
    
    func setup() {
        DataManager.adventureLog.dqSceneType = .opening
        
        self.scene.backgroundColor = .black
        
        let text1 = "それは えにくすが 16さいになる"
        let text2 = "たんじょうびの ことであった。"
        
        self.mapMessageWindowNode = MapMessageWindowNode()
        self.mapMessageWindowNode.addToNode(
            node: self.scene,
            pointX: MapMessageWindowChildOfScenePointX,
            pointY: MapMessageWindowChildOfScenePointY,
            scale: self.scene.scale)
        
        self.mapMessageWindowNode.showMessages(
            text1: text1,
            text2: text2,
            text3: nil,
            withSe: false,
            withNextMark: false,
            completion: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.showSecondMessage()
                }
            })
    }
    
    func showSecondMessage() {
        let text1 = "＊「おきなさい。"
        let text2 = "　　おきなさい　わたしの　かわいい"
        let text3 = "　　えにくすや……。"
        
        Task {
            await mapMessageWindowNode.showMessage(
                string: text1,
                line: 2,
                withSe: true)
            
            await mapMessageWindowNode.showMessage(
                string: text2,
                line: 3,
                withSe: true)
            
            await self.mapMessageWindowNode.moveLine()
            
            await self.mapMessageWindowNode.showMessage(
                string: text3,
                line: 3,
                withSe: true)
            
            await self.mapMessageWindowNode.moveLine()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.mapMessageWindowNode.close()
                
                self.scene.transitionToMap(
                    isFromAdventureLog: false,
                    dqSceneTypeTo: .aliahan_town_house,
                    dqAudio: .town)
            }
        }
    }
}
