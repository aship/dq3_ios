//
//  AdventureLogSceneButton.swift
//  DQ3
//
//  Created by aship on 2020/12/18.
//

import SpriteKit

extension AdventureLogScene {
    func willPress(_ button: ButtonOverlay) {
        if checkIsProcessing() {
           return
        }
        
        if button == self.scene.buttonA {
            self.adventureLogTopWindowNode?.processButtonA()
        }
        else if button == self.scene.buttonB { 
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
