//
//  AdventureLogInputNameWindowNodeButtonA.swift
//  DQ3
//
//  Created by aship on 2021/04/16.
//

import SpriteKit

extension AdventureLogInputNameWindowNode {
    func processButtonA() {
        if let adventureLogSelectGenderWindowNode = self.adventureLogSelectGenderWindowNode {
            adventureLogSelectGenderWindowNode.processButtonA()
            
            return
        }
        
        SoundEffectManager.play(.command)
        
        let tuple = (self.trianglePositionX, self.trianglePositionY)
        
        var letter = ""
        var isBackSpace = false
        var isFinish = false
        
        switch tuple {
        case (0, 0): letter = "あ"
        case (1, 0): letter = "い"
        case (2 ,0): letter = "う"
        case (3, 0): letter = "え"
        case (4, 0): letter = "お"
        case (5, 0): letter = "は"
        case (6, 0): letter = "ひ"
        case (7, 0): letter = "ふ"
        case (8, 0): letter = "へ"
        case (9, 0): letter = "ほ"
        case (0, 1): letter = "か"
        case (1, 1): letter = "き"
        case (2 ,1): letter = "く"
        case (3, 1): letter = "け"
        case (4, 1): letter = "こ"
        case (5, 1): letter = "ま"
        case (6, 1): letter = "み"
        case (7, 1): letter = "む"
        case (8, 1): letter = "め"
        case (9, 1): letter = "も"
        case (0, 2): letter = "さ"
        case (1, 2): letter = "し"
        case (2 ,2): letter = "す"
        case (3, 2): letter = "せ"
        case (4, 2): letter = "そ"
        case (5, 2): letter = "や"
        case (7, 2): letter = "ゆ"
        case (9, 2): letter = "よ"
        case (0, 3): letter = "た"
        case (1, 3): letter = "ち"
        case (2 ,3): letter = "つ"
        case (3, 3): letter = "て"
        case (4, 3): letter = "と"
        case (5, 3): letter = "ら"
        case (6, 3): letter = "り"
        case (7, 3): letter = "る"
        case (8, 3): letter = "れ"
        case (9, 3): letter = "ろ"
        case (0, 4): letter = "な"
        case (1, 4): letter = "に"
        case (2 ,4): letter = "ぬ"
        case (3, 4): letter = "ね"
        case (4, 4): letter = "の"
        case (5, 4): letter = "わ"
        case (7, 4): letter = "を"
        case (9, 4): letter = "ん"
        case (0, 5): letter = "っ"
        case (1, 5): letter = "ゃ"
        case (2 ,5): letter = "ゅ"
        case (3, 5): letter = "ょ"
        case (4, 5): letter = "濁"
        case (5, 5): letter = "半"
        case (6, 5): isBackSpace = true
        case (8, 5): isFinish = true
        default: break
        }
        
        if isBackSpace {
            if 0 < self.letterIndex {
                let action = SKAction.moveBy(x: -8,
                                             y: 0,
                                             duration: 0)
                self.underlineNode?.run(action)
                self.letterIndex -= 1
            }
        }
        else if isFinish {
            if 0 < self.letterIndex {
                pauseTriangleAnimation(triangleNode: self.triangleNode)
                
                processToSelectGender()
            }
        }
        else {
            let pointX = 32 + 8 * self.letterIndex
            
            // 文字入力
            showWord(windowNode: self.nameTileMapNode!,
                     word: letter,
                     pointX: pointX,
                     pointY: -24)
            
            switch self.letterIndex {
            case 0: self.heroName0 = letter
            case 1: self.heroName1 = letter
            case 2: self.heroName2 = letter
            case 3: self.heroName3 = letter
            default: break
            }
            
            if self.letterIndex < 3 {
                let action = SKAction.moveBy(x: 8,
                                             y: 0,
                                             duration: 0)
                self.underlineNode?.run(action)
                self.letterIndex += 1
            }
            else if self.letterIndex == 3 {
                self.underlineNode?.isHidden = true
                
                pauseTriangleAnimation(triangleNode: self.triangleNode)
                
                processToSelectGender()
            }
        }
    }
    
    private func processToSelectGender() {
        let heroName = self.heroName0 + self.heroName1 + self.heroName2 + self.heroName3
        
        let characterNode = CharacterNode(dqCharacter: .hero)
        
        let characterStatus = CharacterStatus()
        characterStatus.name = heroName
        characterStatus.hp = 199
        characterStatus.hpMax = 200
        characterStatus.mp = 199
        characterStatus.mpMax = 200
        characterStatus.level = 20
        
        // 冒険の書を作成
        let adventureLog = AdventureLog()
        adventureLog.heroName = heroName
        adventureLog.partyCharacterNodes.append(characterNode)
        adventureLog.partyCharacterStatuses.append(characterStatus)
        adventureLog.dqSceneType = .opening
        
        DataManager.adventureLog = adventureLog
        
        self.adventureLogSelectGenderWindowNode = AdventureLogSelectGenderWindowNode(
            dqAdventureLogTop: .create,
            adventureLogNumber: self.adventureLogNumber)
        self.adventureLogSelectGenderWindowNode?.addToWindow(windowNode: self)
    }
    
    func processButtonB() {
        if 0 < self.letterIndex {
            let action = SKAction.moveBy(x: -8,
                                         y: 0,
                                         duration: 0)
            self.underlineNode?.run(action)            
            self.letterIndex -= 1
        }
    }
}
