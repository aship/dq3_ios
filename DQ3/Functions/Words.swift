//
//  DQMapSceneWords.swift
//  DQ3
//
//  Created by aship on 2021/01/20.
//

import SpriteKit

func showWords(windowNode: SKTileMapNode,
               words: [String],
               pointX: Int,
               pointY: Int) {
    for (index, word) in words.enumerated() {
        showWord(windowNode: windowNode,
                 word: word,
                 pointX: pointX,
                 pointY: pointY - 16 * index)
    }
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
