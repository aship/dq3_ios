//
//  DQZoom.swift
//  DQ3
//
//  Created by aship on 2021/01/18.
//

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
    case .alltrades_abbey:
        positionX = ZoomAlltradesAbbeyPositionX
        positionY = ZoomAlltradesAbbeyPositionY
    case .lanson:
        positionX = ZoomLansonPositionX
        positionY = ZoomLansonPositionY
    case .jipang:
        positionX = ZoomJipangPositionX
        positionY = ZoomJipangPositionY
    case .edina:
        positionX = ZoomEdinaPositionX
        positionY = ZoomEdinaPositionY
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
    case .alltrades_abbey: name = "ダーマ"
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
    case alltrades_abbey // ダーマ
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
