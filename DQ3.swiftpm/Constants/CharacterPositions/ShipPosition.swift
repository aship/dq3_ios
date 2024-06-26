//
//  FieldShip.swift
//  DQ3
//
//  Created by aship on 2021/04/28.
//

// アリアハン
let ShipAliahanPositionX = 165
let ShipAliahanPositionY = 40

// レーベ
let ShipReevePositionX = 156
let ShipReevePositionY = 73

// ロマリア
let ShipRomariaPositionX = 47
let ShipRomariaPositionY = 173

// カザーブ
let ShipKhoryvPositionX = 60
let ShipKhoryvPositionY = 235

// ノアニール
let ShipNorvikPositionX = 57
let ShipNorvikPositionY = 237

// アッサラーム
let ShipAshamPositionX = 83
let ShipAshamPositionY = 148

// イシス
let ShipIsisPositionX = 38
let ShipIsisPositionY = 151

// ポルトガ
let ShipPortogaPositionX = 21
let ShipPortogaPositionY = 162

// バハラタ
let ShipBaharataPositionX = 115
let ShipBaharataPositionY = 102

// ダーマ
let ShipAlltradesAbbeyPositionX = 123
let ShipAlltradesAbbeyPositionY = 128

// ランシール
let ShipLansonPositionX = 112
let ShipLansonPositionY = 45

// ジパング
let ShipJipangPositionX = 153
let ShipJipangPositionY = 115

// エジンベア
let ShipEdinaPositionX = 15
let ShipEdinaPositionY = 217

// サマンオサ
let ShipManozaPositionX = 221
let ShipManozaPositionY = 89

// スー
let ShipPersistencePositionX = 213
let ShipPersistencePositionY = 184

// ラダトーム
let ShipTantegelPositionX = 55
let ShipTantegelPositionY = 90

// ドムドーラ
let ShipDamdaraPositionX = 34
let ShipDamdaraPositionY = 39

// メルキド
let ShipCantlinPositionX = 77
let ShipCantlinPositionY = 30

// マイラ
let ShipKolPositionX = 114
let ShipKolPositionY = 121

// リムルダール
let ShipRimuldarPositionX = 142
let ShipRimuldarPositionY = 53

func getShipDefaltPosition(dqZoom: DQZoom) -> (Int, Int) {
    var positionX = 0
    var positionY = 0

    switch dqZoom {
    case .aliahan:
        positionX = ShipAliahanPositionX
        positionY = ShipAliahanPositionY
    case .reeve:
        positionX = ShipReevePositionX
        positionY = ShipReevePositionY
    case .romaria:
        positionX = ShipRomariaPositionX
        positionY = ShipRomariaPositionY
    case .khoryv:
        positionX = ShipKhoryvPositionX
        positionY = ShipKhoryvPositionY
    case .norvik:
        positionX = ShipNorvikPositionX
        positionY = ShipNorvikPositionY
    case .asham:
        positionX = ShipAshamPositionX
        positionY = ShipAshamPositionY
    case .isis:
        positionX = ShipIsisPositionX
        positionY = ShipIsisPositionY
    case .portoga:
        positionX = ShipPortogaPositionX
        positionY = ShipPortogaPositionY
    case .baharata:
        positionX = ShipBaharataPositionX
        positionY = ShipBaharataPositionY
    case .alltrades_abbey:
        positionX = ShipAlltradesAbbeyPositionX
        positionY = ShipAlltradesAbbeyPositionY
    case .lanson:
        positionX = ShipLansonPositionX
        positionY = ShipLansonPositionY
    case .jipang:
        positionX = ShipJipangPositionX
        positionY = ShipJipangPositionY
    case .edina:
        positionX = ShipEdinaPositionX
        positionY = ShipEdinaPositionY
    case .manoza:
        positionX = ShipManozaPositionX
        positionY = ShipManozaPositionY
    case .persistence:
        positionX = ShipPersistencePositionX
        positionY = ShipPersistencePositionY
    case .tantegel:
        positionX = ShipTantegelPositionX
        positionY = ShipTantegelPositionY
    case .damdara:
        positionX = ShipDamdaraPositionX
        positionY = ShipDamdaraPositionY
    case .cantlin:
        positionX = ShipCantlinPositionX
        positionY = ShipCantlinPositionY
    case .kol:
        positionX = ShipKolPositionX
        positionY = ShipKolPositionY
    case .rimuldar:
        positionX = ShipRimuldarPositionX
        positionY = ShipRimuldarPositionY
    default: break
    }

    return (positionX, positionY)
}
