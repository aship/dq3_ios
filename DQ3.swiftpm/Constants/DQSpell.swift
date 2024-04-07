//
//  DQSpell.swift
//  DQ3
//
//  Created by aship on 2021/01/18.
//

func getSpellNameFrom(dqSpell: DQSpell) -> String {
    var name: String!

    switch dqSpell {
    case .heal: name = "ホイミ"
    case .midheal: name = "ベホイミ"
    case .fullheal: name = "ベホマ"
    case .multiheal: name = "ベホマラー"
    case .omniheal: name = "ベホマズン"
    case .squelch: name = "キアリー"
    case .tingle: name = "キアリク"
    case .cock_a_doodle_doo: name = "ザメハ"
    case .zing: name = "ザオラル"
    case .kazing: name = "ザオリク"
    case .frizz: name = "メラ"
    case .frizzle: name = "メラミ"
    case .kafrizzle: name = "メラゾーマ"
    case .crack: name = "ヒャド"
    case .crackle: name = "ヒャダルコ"
    case .kacrack: name = "ヒャダイン"
    case .kacrackle: name = "マヒャド"
    case .sizz: name = "ギラ"
    case .sizzle: name = "ベギラマ"
    case .kasizzle: name = "ベギラゴン"
    case .woosh: name = "バギ"
    case .swoosh: name = "バギマ"
    case .kaswoosh: name = "バギクロス"
    case .bang: name = "イオ"
    case .boom: name = "イオラ"
    case .kaboom: name = "イオナズン"
    case .zap: name = "ライデイン"
    case .kazap: name = "ギガデイン"
    case .whack: name = "ザキ"
    case .thwack: name = "ザラキ"
    case .puff: name = "ドラゴラム"
    case .kamikazee: name = "メガンテ"
    case .sap: name = "ルカニ"
    case .kasap: name = "ルカナン"
    case .snooze: name = "ラリホー"
    case .dazzle: name = "マヌーサ"
    case .deceleratle: name = "ボミオス"
    case .fizzle: name = "マホトーン"
    case .oomph: name = "バイキルト"
    case .fuddle: name = "メダパニ"
    case .drain_magic: name = "マホトラ"
    case .poof: name = "ニフラム"
    case .blasto: name = "バシルーラ"
    case .hocus_pocus: name = "パルプンテ"
    case .buff: name = "スカラ"
    case .kabuff: name = "スクルト"
    case .clang: name = "アストロン"
    case .acceleratle: name = "ピオリム"
    case .bounce: name = "マホカンタ"
    case .insulatle: name = "フバーハ"
    case .transform: name = "モシャス"
    case .zoom: name = "ルーラ"
    case .rvac: name = "リレミト"
    case .holy_protection: name = "トヘロス"
    case .safe_passage: name = "トラマナ"
    case .sheen: name = "シャナク"
    case .peep: name = "インパス"
    case .tick_tock: name = "ラナルータ"
    case .fade: name = "レムオル"
    case .click: name = "アバカム"
    }

    return name
}

enum DQSpell {
    case heal  // ホイミ
    case midheal  // ベホイミ
    case fullheal  // ベホマ
    case multiheal  // ベホマラー
    case omniheal  // ベホマズン
    case squelch  // キアリー
    case tingle  // キアリク
    case cock_a_doodle_doo  // ザメハ
    case zing  // ザオラル
    case kazing  // ザオリク
    case frizz  // メラ
    case frizzle  // メラミ
    case kafrizzle  // メラゾーマ
    case crack  // ヒャド
    case crackle  // ヒャダルコ
    case kacrack  // ヒャダイン
    case kacrackle  // マヒャド
    case sizz  // ギラ
    case sizzle  // ベギラマ
    case kasizzle  // ベギラゴン
    case woosh  // バギ
    case swoosh  // バギマ
    case kaswoosh  // バギクロス
    case bang  // イオ
    case boom  // イオラ
    case kaboom  // イオナズン
    case zap  // ライデイン
    case kazap  // ギガデイン
    case whack  // ザキ
    case thwack  // ザラキ
    case puff  // ドラゴラム
    case kamikazee  // メガンテ
    case sap  // ルカニ
    case kasap  // ルカナン
    case snooze  // ラリホー
    case dazzle  // マヌーサ
    case deceleratle  // ボミオス
    case fizzle  // マホトーン
    case oomph  // バイキルト
    case fuddle  // メダパニ
    case drain_magic  // マホトラ
    case poof  // ニフラム
    case blasto  // バシルーラ
    case hocus_pocus  // パルプンテ
    case buff  // スカラ
    case kabuff  // スクルト
    case clang  // アストロン
    case acceleratle  // ピオリム
    case bounce  // マホカンタ
    case insulatle  // フバーハ
    case transform  // モシャス
    case zoom  // ルーラ
    case rvac  // リレミト
    case holy_protection  // トヘロス
    case safe_passage  // トラマナ
    case sheen  // シャナク
    case peep  // インパス
    case tick_tock  // ラナルータ
    case fade  // レムオル
    case click  // アバカム
}
