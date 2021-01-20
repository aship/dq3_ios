//
//  BaseMapSceneCommand.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

extension BaseMapScene {
    func closeCommandWindow(commandWindowNode: SKTileMapNode,
                            isCommandWindowOpen: inout Bool) {
        commandWindowNode.removeFromParent()
        isCommandWindowOpen = false
    }
    
    func addCommandWindow(commandWindowNode: inout SKTileMapNode,
                          isCommandWindowOpen: inout Bool,
                          scale: CGFloat) {
        commandWindowNode.removeFromParent()
        
        // x: 48, y: 8 は左上(0, 0)基準
        let pointX = -128 + 48
        let pointY = 112 - 8
        
        commandWindowNode = generateWindow(pointX: pointX,
                                           pointY: pointY,
                                           numberOfColumns: 12,
                                           numberOfRows: 8,
                                           scale: scale)
        
        commandWindowNode.zPosition = ZPositionWindow
        self.addChild(commandWindowNode)
        
        // ドだけ濁点が上に飛び出ない特別フォント
        showWord(windowNode: commandWindowNode,
                 word: "コマン度",
                 pointX: 32,
                 pointY: -8)
        
        showWord(windowNode: commandWindowNode,
                 word: "はなす",
                 pointX: 16,
                 pointY: -24)
        
        showWord(windowNode: commandWindowNode,
                 word: "じゅもん",
                 pointX: 56,
                 pointY: -24)
        
        showWord(windowNode: commandWindowNode,
                 word: "つよさ",
                 pointX: 16,
                 pointY: -40)
        
        showWord(windowNode: commandWindowNode,
                 word: "どうぐ",
                 pointX: 56,
                 pointY: -40)
        
        showWord(windowNode: commandWindowNode,
                 word: "そうび",
                 pointX: 16,
                 pointY: -56)
        
        showWord(windowNode: commandWindowNode,
                 word: "しらべる",
                 pointX: 56,
                 pointY: -56)
        
        addTriangle(windowNode: commandWindowNode,
                    triangleNode: &self.triangleNode,
                    pointX: 8,
                    pointY: -24)
        
        isCommandWindowOpen = true
    }
    
    func showWord(windowNode: SKTileMapNode,
                  word: String,
                  pointX: Int,
                  pointY: Int) {
        for (index, letter) in word.enumerated() {
            let node = DQFont.getFont(string: String(letter))
            node.position = CGPoint(x: pointX + 8 * index,
                                    y: pointY)
            windowNode.addChild(node)
        }
    }
    
    
    
    func addCommandWindow(node: SKSpriteNode,
                          scale: CGFloat) {
        // 左上基準
        node.anchorPoint = CGPoint(x: 0.0, y: 1.0)
        
        let pointX: CGFloat = (-128 + 48) * scale
        let pointY: CGFloat = (112 - 8) * scale
        
        node.position = CGPoint(x: pointX, y: pointY)
        node.setScale(scale)
        node.isHidden = true
        
        self.addChild(node)
    }
}
