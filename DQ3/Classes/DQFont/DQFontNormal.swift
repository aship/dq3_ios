//
//  DQFontNormal.swift
//  DQ3
//
//  Created by aship on 2021/01/18.
//

import SpriteKit

extension DQFont {
    class func getFontNormal(string: String) -> SKSpriteNode {
        var path: String!
        
        switch string {
        case " ": path = "window/space"
        case "　": path = "window/space"
        case "＊": path = "symbol/kome"
        case "*": path = "symbol/kome"
        case "「": path = "symbol/kakko"
        case "-": path = "symbol/hyphen"
        case "ー": path = "symbol/hyphen"
        case "_": path = "symbol/underline"
        case "。": path = "symbol/kuten"
        case "…": path = "symbol/three_dots"
        case "▼": path = "symbol/triangle_down"
        case "▶︎": path = "symbol/triangle_right"
        case "→": path = "symbol/arrow"
        case "?": path = "symbol/question"
        case "？": path = "symbol/question"
        case "!": path = "symbol/exclamation"
        case "！": path = "symbol/exclamation"
        case ":": path = "symbol/colon"
        case "濁": path = "symbol/dakuten"
        case "半": path = "symbol/handakuten"
        case "度": path = "katakana/do"
        case "怒": path = "hiragana/do"
        case "A": path = "alphabet/a"
        case "B": path = "alphabet/b"
        case "C": path = "alphabet/c"
        case "D": path = "alphabet/d"
        case "H": path = "alphabet/h"
        case "M": path = "alphabet/m"
        case "0": path = "number/0"
        case "1": path = "number/1"
        case "2": path = "number/2"
        case "3": path = "number/3"
        case "4": path = "number/4"
        case "5": path = "number/5"
        case "6": path = "number/6"
        case "7": path = "number/7"
        case "8": path = "number/8"
        case "9": path = "number/9"
        case "あ": path = "hiragana/a"
        case "い": path = "hiragana/i"
        case "う": path = "hiragana/u"
        case "え": path = "hiragana/e"
        case "お": path = "hiragana/o"
        case "か": path = "hiragana/ka"
        case "き": path = "hiragana/ki"
        case "く": path = "hiragana/ku"
        case "け": path = "hiragana/ke"
        case "こ": path = "hiragana/ko"
        case "さ": path = "hiragana/sa"
        case "し": path = "hiragana/si"
        case "す": path = "hiragana/su"
        case "せ": path = "hiragana/se"
        case "そ": path = "hiragana/so"
        case "た": path = "hiragana/ta"
        case "ち": path = "hiragana/ti"
        case "つ": path = "hiragana/tu"
        case "て": path = "hiragana/te"
        case "と": path = "hiragana/to"
        case "な": path = "hiragana/na"
        case "に": path = "hiragana/ni"
        case "ぬ": path = "hiragana/nu"
        case "ね": path = "hiragana/ne"
        case "の": path = "hiragana/no"
        case "は": path = "hiragana/ha"
        case "ひ": path = "hiragana/hi"
        case "ふ": path = "hiragana/hu"
        case "へ": path = "hiragana/he"
        case "ほ": path = "hiragana/ho"
        case "ま": path = "hiragana/ma"
        case "み": path = "hiragana/mi"
        case "む": path = "hiragana/mu"
        case "め": path = "hiragana/me"
        case "も": path = "hiragana/mo"
        case "や": path = "hiragana/ya"
        case "ゆ": path = "hiragana/yu"
        case "よ": path = "hiragana/yo"
        case "ら": path = "hiragana/ra"
        case "り": path = "hiragana/ri"
        case "る": path = "hiragana/ru"
        case "れ": path = "hiragana/re"
        case "ろ": path = "hiragana/ro"
        case "わ": path = "hiragana/wa"
        case "を": path = "hiragana/wo"
        case "ん": path = "hiragana/n"
        case "ゃ": path = "hiragana/xya"
        case "ゅ": path = "hiragana/xyu"
        case "ょ": path = "hiragana/xyo"
        case "っ": path = "hiragana/xtu"
        case "ア": path = "katakana/a"
        case "イ": path = "katakana/i"
        case "ウ": path = "katakana/u"
        case "エ": path = "katakana/e"
        case "オ": path = "katakana/o"
        case "カ": path = "katakana/ka"
        case "キ": path = "katakana/ki"
        case "ク": path = "katakana/ku"
        case "ケ": path = "katakana/ke"
        case "コ": path = "katakana/ko"
        case "サ": path = "katakana/sa"
        case "シ": path = "katakana/si"
        case "ス": path = "katakana/su"
        case "セ": path = "katakana/se"
        case "ソ": path = "katakana/so"
        case "タ": path = "katakana/ta"
        case "チ": path = "katakana/ti"
        case "ツ": path = "katakana/tu"
        case "テ": path = "katakana/te"
        case "ト": path = "katakana/to"
        case "ナ": path = "katakana/na"
        case "ニ": path = "katakana/ni"
        case "ヌ": path = "katakana/nu"
        case "ネ": path = "katakana/ne"
        case "ノ": path = "katakana/no"
        case "ハ": path = "katakana/ha"
        case "ヒ": path = "katakana/hi"
        case "フ": path = "katakana/hu"
        case "ヘ": path = "katakana/he"
        case "ホ": path = "katakana/ho"
        case "マ": path = "katakana/ma"
        case "ミ": path = "katakana/mi"
        case "ム": path = "katakana/mu"
        case "メ": path = "katakana/me"
        case "モ": path = "katakana/mo"
        case "ヤ": path = "katakana/ya"
        case "ユ": path = "katakana/yu"
        case "ヨ": path = "katakana/yo"
        case "ラ": path = "katakana/ra"
        case "リ": path = "katakana/ri"
        case "ル": path = "katakana/ru"
        case "レ": path = "katakana/re"
        case "ロ": path = "katakana/ro"
        case "ワ": path = "katakana/wa"
        case "ヲ": path = "katakana/wo"
        case "ン": path = "katakana/n"
        case "ャ": path = "katakana/xya"
        case "ュ": path = "katakana/xyu"
        case "ョ": path = "katakana/xyo"
        case "ッ": path = "katakana/xtu"
        default: path = "symbol/question"
        }
        
        let node = SKSpriteNode(imageNamed: "font/\(path!)")
        node.anchorPoint = CGPoint(x: 0, y: 0)
        
        return node
    }
}
