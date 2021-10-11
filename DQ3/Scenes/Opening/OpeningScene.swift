//
//  OpeningScene.swift
//  DQ3
//
//  Created by aship on 2020/12/19.
//

import SpriteKit

class OpeningScene: BaseMapScene,
                    PadOverlayDelegate,
                    ButtonOverlayDelegate {
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        self.leftPad.delegate = self
        self.buttonA.delegate = self
        self.buttonB.delegate = self
    }
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .black
        
        setupVirtualPad(leftPad: self.leftPad,
                        buttonA: self.buttonA,
                        buttonB: self.buttonB)
        
        let text1 = "それは えにくすが 16さいになる"
        let text2 = "たんじょうびの ことであった。"
        
        self.mapMessageWindowNode = MapMessageWindowNode()
        self.mapMessageWindowNode.showMessages(
            scene: self,
            text1: text1,
            text2: text2,
            text3: nil,
            withSe: false,
            withNextMark: false,
            pointX: MapMessageWindowChildOfScenePointX,
            pointY: MapMessageWindowChildOfScenePointY,
            scale: self.scale,
            completion: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.showSecondMessage()
                }
            })
    }
    
    func showSecondMessage() {
        let text1 = "＊「おきなさい。"
        let text2 = "  おきなさい わたしの かわいい"
        let text3 = "  えにくすや……。"
        
        Task {
            await mapMessageWindowNode.showMessage(
                string: text1,
                line: 2,
                withSe: true)
            
            await mapMessageWindowNode.showMessage(
                string: text2,
                line: 3,
                withSe: true)
            
            self.mapMessageWindowNode.moveLine()
            
            await self.mapMessageWindowNode.showMessage(
                string: text3,
                line: 3,
                withSe: true)
            
            self.mapMessageWindowNode.moveLine()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.mapMessageWindowNode.close()

                let scene = AliahanTownHouseScene()

                let transition = SKTransition.crossFade(withDuration: 0.5)
                self.view?.presentScene(scene,
                                        transition: transition)
            }
        }
    }
}
