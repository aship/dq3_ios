//
//  DQMapSceneFont.swift
//  DQ3
//
//  Created by aship on 2021/01/14.
//

import SpriteKit

class DQFont {
    enum DQFontType {
        case none
        case little_dashes // 濁点
        case little_circle // 半濁点
    }
    
    class func getFont(string: String) -> SKSpriteNode {
        var node: SKSpriteNode!
        
        let dqFontType = DQFont.checkDqFontType(string: string)
        
        if dqFontType == .none {
            node = DQFont.getFontNormal(string: string)
        }
        else if dqFontType == .little_dashes {
            // 濁点付き文字は特殊処理
            node = DQFont.getFontWithLittleDashes(string: string)
        }
        else if dqFontType == .little_circle {
            // 半濁点付き文字は特殊処理
            node = DQFont.getFontWithLittleCircle(string: string)
        }
        
        return node
    }
}
