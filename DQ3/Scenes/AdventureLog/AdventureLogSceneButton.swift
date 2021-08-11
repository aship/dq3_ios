//
//  AdventureLogScenePad.swift
//  DQ3
//
//  Created by aship on 2020/12/18.
//

import SpriteKit

extension AdventureLogScene {
    func padOverlayVirtualStickInteractionDidStart(_ padNode: PadOverlay) {
    }
    
    func padOverlayVirtualStickInteractionDidChange(_ padNode: PadOverlay) {
        self.padDirection = getDirection(stickPositionX: padNode.stickPosition.x,
                                         stickPositionY: padNode.stickPosition.y)
    }
    
    func padOverlayVirtualStickInteractionDidEnd(_ padNode: PadOverlay) {
        self.padDirection = .neutral
    }
    
    func willPress(_ button: ButtonOverlay) {
        if !self.isProcessing {
            
            if button == self.buttonA {
                self.adventureLogTopWindowNode?.processButtonA()
            }
            else if button == self.buttonB {
                if let topWindowNode = self.adventureLogTopWindowNode {
                    if let selectEmptyLogWindowNode = topWindowNode.adventureLogSelectEmptyLogWindowNode {
                        if let inputNameWindowNode = selectEmptyLogWindowNode.adventureLogInputNameWindowNode {
                            if inputNameWindowNode.adventureLogSelectGenderWindowNode == nil {
                                // 冒険の書をつくるで、名前入力時のみ、バックスペース扱い
                                inputNameWindowNode.processButtonB()
                                
                                return
                            }
                        }
                    }
                }
                
                // それ以外の B は最初の画面に戻る
                reloadAdventureLogScene()
            }
        }
    }
    
    func didPress(_ button: ButtonOverlay) {
    }
}
