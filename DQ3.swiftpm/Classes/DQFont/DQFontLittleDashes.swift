//
//  DQFontLittleDashes.swift
//  DQ3
//
//  Created by aship on 2021/01/18.
//

import SpriteKit

extension DQFont {
    internal class func getFontWithLittleDashes(string: String) -> SKSpriteNode {
        var path: String!

        switch string {
        case "が": path = "hiragana/ka"
        case "ぎ": path = "hiragana/ki"
        case "ぐ": path = "hiragana/ku"
        case "げ": path = "hiragana/ke"
        case "ご": path = "hiragana/ko"
        case "ざ": path = "hiragana/sa"
        case "じ": path = "hiragana/si"
        case "ず": path = "hiragana/su"
        case "ぜ": path = "hiragana/se"
        case "ぞ": path = "hiragana/so"
        case "だ": path = "hiragana/ta"
        case "ぢ": path = "hiragana/ti"
        case "づ": path = "hiragana/tu"
        case "で": path = "hiragana/te"
        case "ど": path = "hiragana/to"
        case "ば": path = "hiragana/ha"
        case "び": path = "hiragana/hi"
        case "ぶ": path = "hiragana/hu"
        case "べ": path = "hiragana/he"
        case "ぼ": path = "hiragana/ho"
        case "ガ": path = "katakana/ka"
        case "ギ": path = "katakana/ki"
        case "グ": path = "katakana/ku"
        case "ゲ": path = "katakana/ke"
        case "ゴ": path = "katakana/ko"
        case "ザ": path = "katakana/sa"
        case "ジ": path = "katakana/si"
        case "ズ": path = "katakana/su"
        case "ゼ": path = "katakana/se"
        case "ゾ": path = "katakana/so"
        case "ダ": path = "katakana/ta"
        case "ヂ": path = "katakana/ti"
        case "ヅ": path = "katakana/tu"
        case "デ": path = "katakana/te"
        case "ド": path = "katakana/to"
        case "バ": path = "katakana/ha"
        case "ビ": path = "katakana/hi"
        case "ブ": path = "katakana/hu"
        case "ベ": path = "katakana/he"
        case "ボ": path = "katakana/ho"
        default: break
        }

        // 濁点ノード
        let nodeLittleDashes = SKSpriteNode(imageNamed: "font/symbol/dakuten_down")
        nodeLittleDashes.anchorPoint = CGPoint(x: 0, y: 0)
        // 8 ドット上にずらす
        nodeLittleDashes.position = CGPoint(x: 0, y: 8)

        let nodeWord = SKSpriteNode(imageNamed: "font/\(path!)")
        nodeWord.anchorPoint = CGPoint(x: 0, y: 0)

        let baseNode = SKSpriteNode()
        nodeWord.anchorPoint = CGPoint(x: 0, y: 0)
        baseNode.addChild(nodeWord)
        baseNode.addChild(nodeLittleDashes)

        return baseNode
    }
}
