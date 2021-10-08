//
//  DQFontCheck.swift
//  DQ3
//
//  Created by aship on 2021/01/18.
//

import SpriteKit

extension DQFont {
    class func checkDqFontType(string: String) -> DQFontType {
        var dqFontType: DQFontType = .none
        
        switch string {
        case "が": dqFontType = .little_dashes
        case "ぎ": dqFontType = .little_dashes
        case "ぐ": dqFontType = .little_dashes
        case "げ": dqFontType = .little_dashes
        case "ご": dqFontType = .little_dashes
        case "ざ": dqFontType = .little_dashes
        case "じ": dqFontType = .little_dashes
        case "ず": dqFontType = .little_dashes
        case "ぜ": dqFontType = .little_dashes
        case "ぞ": dqFontType = .little_dashes
        case "だ": dqFontType = .little_dashes
        case "ぢ": dqFontType = .little_dashes
        case "づ": dqFontType = .little_dashes
        case "で": dqFontType = .little_dashes
        case "ど": dqFontType = .little_dashes
        case "ば": dqFontType = .little_dashes
        case "び": dqFontType = .little_dashes
        case "ぶ": dqFontType = .little_dashes
        case "べ": dqFontType = .little_dashes
        case "ぼ": dqFontType = .little_dashes
        case "ぱ": dqFontType = .little_circle
        case "ぴ": dqFontType = .little_circle
        case "ぷ": dqFontType = .little_circle
        case "ぺ": dqFontType = .little_circle
        case "ぽ": dqFontType = .little_circle
        case "ガ": dqFontType = .little_dashes
        case "ギ": dqFontType = .little_dashes
        case "グ": dqFontType = .little_dashes
        case "ゲ": dqFontType = .little_dashes
        case "ゴ": dqFontType = .little_dashes
        case "ザ": dqFontType = .little_dashes
        case "ジ": dqFontType = .little_dashes
        case "ズ": dqFontType = .little_dashes
        case "ゼ": dqFontType = .little_dashes
        case "ゾ": dqFontType = .little_dashes
        case "ダ": dqFontType = .little_dashes
        case "ヂ": dqFontType = .little_dashes
        case "ヅ": dqFontType = .little_dashes
        case "デ": dqFontType = .little_dashes
        case "ド": dqFontType = .little_dashes
        case "バ": dqFontType = .little_dashes
        case "ビ": dqFontType = .little_dashes
        case "ブ": dqFontType = .little_dashes
        case "ベ": dqFontType = .little_dashes
        case "ボ": dqFontType = .little_dashes
        case "パ": dqFontType = .little_circle
        case "ピ": dqFontType = .little_circle
        case "プ": dqFontType = .little_circle
        case "ペ": dqFontType = .little_circle
        case "ポ": dqFontType = .little_circle
        default: break
        }
        
        return dqFontType
    }
}
