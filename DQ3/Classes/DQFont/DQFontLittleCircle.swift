//
//  DQFontCircle.swift
//  DQ3
//
//  Created by aship on 2021/01/18.
//

import SpriteKit

extension DQFont {
    class func getFontWithLittleCircle(string: String) -> SKSpriteNode {
        var path: String!
        
        switch string {
        case "ぱ": path = "hiragana/ha"
        case "ぴ": path = "hiragana/hi"
        case "ぷ": path = "hiragana/hu"
        case "ぺ": path = "hiragana/he"
        case "ぽ": path = "hiragana/ho"
        case "パ": path = "katakana/ha"
        case "ピ": path = "katakana/hi"
        case "プ": path = "katakana/hu"
        case "ペ": path = "katakana/he"
        case "ポ": path = "katakana/ho"
        default: break
        }
        
        // 半濁点ノード
        let nodeLittleDashes = SKSpriteNode(imageNamed: "font/symbol/handakuten_down")
        nodeLittleDashes.anchorPoint = CGPoint(x: 0, y: 0)
        // 8 ドット上にずらす
        nodeLittleDashes.position = CGPoint(x: 0, y: 8)
        
        let nodeWord = SKSpriteNode(imageNamed: "font/\(path!)")
        nodeWord.anchorPoint = CGPoint(x: 0, y: 0)
        
        let baseNode = SKSpriteNode()
        nodeWord.anchorPoint = CGPoint(x: 0,  y: 0)
        baseNode.addChild(nodeWord)
        baseNode.addChild(nodeLittleDashes)
        
        return baseNode
    }
}
