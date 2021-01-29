//
//  DQZoom.swift
//  DQ3
//
//  Created by aship on 2021/01/18.
//

let ZoomAliahanPositionX = 169
let ZoomAliahanPositionY = 41

let ZoomReevePositionX = 156
let ZoomReevePositionY = 67

let ZoomRomariaPositionX = 49
let ZoomRomariaPositionY = 171

let ZoomKhoryvPositionX = 62
let ZoomKhoryvPositionY = 221

let ZoomNorvikPositionX = 53
let ZoomNorvikPositionY = 239

let ZoomAshamPositionX = 83
let ZoomAshamPositionY = 149

let ZoomIsisPositionX = 32
let ZoomIsisPositionY = 122

let ZoomPortogaPositionX = 23
let ZoomPortogaPositionY = 162

let ZoomBaharataPositionX = 110
let ZoomBaharataPositionY = 106

let ZoomAlltradesSbbeyPositionX = 119
let ZoomAlltradesSbbeyPositionY = 130

let ZoomLansonPositionX = 105
let ZoomLansonPositionY = 43

let ZoomJipangPositionX = 154
let ZoomJipangPositionY = 114

let ZooMedinaPositionX = 16
let ZooMedinaPositionY = 216

let ZoomManozaPositionX = 212
let ZoomManozaPositionY = 105

let ZoomPersistencePositionX = 212
let ZoomPersistencePositionY = 183

let ZoomTantegelPositionX = 70
let ZoomTantegelPositionY = 88

let ZoomDamdaraPositionX = 52
let ZoomDamdaraPositionY = 42

let ZoomCantlinPositionX = 100
let ZoomCantlinPositionY = 29

let ZoomKolPositionX = 131
let ZoomKolPositionY = 121

let ZoomRimuldarPositionX = 129
let ZoomRimuldarPositionY = 59

func getZoomPosition(dqZoom: DQZoom) -> (Int, Int) {
    var positionX: Int!
    var positionY: Int!
    
    switch dqZoom {
    case .next_page: break
    case .aliahan:
        positionX = ZoomAliahanPositionX
        positionY = ZoomAliahanPositionY
    case .reeve:
        positionX = ZoomReevePositionX
        positionY = ZoomReevePositionY
    case .romaria:
        positionX = ZoomRomariaPositionX
        positionY = ZoomRomariaPositionY
    case .khoryv:
        positionX = ZoomKhoryvPositionX
        positionY = ZoomKhoryvPositionY
    case .norvik:
        positionX = ZoomNorvikPositionX
        positionY = ZoomNorvikPositionY
    case .asham:
        positionX = ZoomAshamPositionX
        positionY = ZoomAshamPositionY
    case .isis:
        positionX = ZoomIsisPositionX
        positionY = ZoomIsisPositionY
    case .portoga:
        positionX = ZoomPortogaPositionX
        positionY = ZoomPortogaPositionY
    case .baharata:
        positionX = ZoomBaharataPositionX
        positionY = ZoomBaharataPositionY
    case .alltrades_sbbey:
        positionX = ZoomAlltradesSbbeyPositionX
        positionY = ZoomAlltradesSbbeyPositionY
    case .lanson:
        positionX = ZoomLansonPositionX
        positionY = ZoomLansonPositionY
    case .jipang:
        positionX = ZoomJipangPositionX
        positionY = ZoomJipangPositionY
    case .edina:
        positionX = ZooMedinaPositionX
        positionY = ZooMedinaPositionY
    case .manoza:
        positionX = ZoomManozaPositionX
        positionY = ZoomManozaPositionY
    case .persistence:
        positionX = ZoomPersistencePositionX
        positionY = ZoomPersistencePositionY
    case .tantegel:
        positionX = ZoomTantegelPositionX
        positionY = ZoomTantegelPositionY
    case .damdara:
        positionX = ZoomDamdaraPositionX
        positionY = ZoomDamdaraPositionY
    case .cantlin:
        positionX = ZoomCantlinPositionX
        positionY = ZoomCantlinPositionY
    case .kol:
        positionX = ZoomKolPositionX
        positionY = ZoomKolPositionY
    case .rimuldar:
        positionX = ZoomRimuldarPositionX
        positionY = ZoomRimuldarPositionY
    }
    
    return (positionX, positionY)
}

func getZoomNameFrom(dqZoom: DQZoom) -> String {
    var name: String!
    
    switch dqZoom {
    case .next_page: break
    case .aliahan: name = "アリアハン"
    case .reeve: name = "レーベ"
    case .romaria: name = "ロマリア"
    case .khoryv: name = "カザーブ"
    case .norvik: name = "ノアニール"
    case .asham: name = "アッサラーム"
    case .isis: name = "イシス"
    case .portoga: name = "ポルトガ"
    case .baharata: name = "バハラタ"
    case .alltrades_sbbey: name = "ダーマ"
    case .lanson: name = "ランシール"
    case .jipang: name = "ジパング"
    case .edina: name = "エジンベア"
    case .manoza: name = "サマンオサ"
    case .persistence: name = "スー"
    case .tantegel: name = "ラダトーム"
    case .damdara: name = "ドムドーラ"
    case .cantlin: name = "メルキド"
    case .kol: name = "マイラ"
    case .rimuldar: name = "リムルダール"
    }
    
    return name
}

// ルーラの行き先
enum DQZoom {
    case next_page // ページ送りのための特殊要素
    case aliahan // アリアハン
    case reeve // レーベ
    case romaria // ロマリア
    case khoryv // カザーブ
    case norvik // ノアニール
    case asham // アッサラーム
    case isis // イシス
    case portoga // ポルトガ
    case baharata  // バハラタ
    case alltrades_sbbey // ダーマ
    case lanson // ランシール
    case jipang // ジパング
    case edina // エジンベア
    case manoza // サマンオサ
    case persistence // スー
    case tantegel // ラダトーム
    case damdara // ドムドーラ
    case cantlin // メルキド
    case kol // マイラ
    case rimuldar // リムルダール
   // case mur // ムオル
   // case alefgard // アレフガルド
}
