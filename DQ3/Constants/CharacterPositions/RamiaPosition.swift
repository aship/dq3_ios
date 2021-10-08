//
//  RamiaPosition.swift
//  DQ3
//
//  Created by aRamia on 2021/04/28.
//

// アリアハン
let RamiaAliahanPositionX = 168
let RamiaAliahanPositionY = 41

// レーベ
let RamiaReevePositionX = 156
let RamiaReevePositionY = 67

// ロマリア
let RamiaRomariaPositionX = 49
let RamiaRomariaPositionY = 171

// カザーブ
let RamiaKhoryvPositionX = 62
let RamiaKhoryvPositionY = 221

// ノアニール
let RamiaNorvikPositionX = 53
let RamiaNorvikPositionY = 239

// アッサラーム
let RamiaAshamPositionX = 83
let RamiaAshamPositionY = 149

// イシス
let RamiaIsisPositionX = 32
let RamiaIsisPositionY = 122

// ポルトガ
let RamiaPortogaPositionX = 23
let RamiaPortogaPositionY = 162

// バハラタ
let RamiaBaharataPositionX = 110
let RamiaBaharataPositionY = 106

// ダーマ
let RamiaAlltradesSbbeyPositionX = 118
let RamiaAlltradesSbbeyPositionY = 130

// らんシール
let RamiaLansonPositionX = 105
let RamiaLansonPositionY = 43

// ジパング
let RamiaJipangPositionX = 154
let RamiaJipangPositionY = 114

// エジンベア
let RamiaEdinaPositionX = 16
let RamiaEdinaPositionY = 216

// サマンオサ
let RamiaManozaPositionX = 212
let RamiaManozaPositionY = 105

// スー
let RamiaPersistencePositionX = 212
let RamiaPersistencePositionY = 183

func getRamiaDefaltPosition(dqZoom: DQZoom) -> (Int, Int) {
    var positionX = 0
    var positionY = 0
    
    switch dqZoom {
    case .aliahan:
        positionX = RamiaAliahanPositionX
        positionY = RamiaAliahanPositionY
    case .reeve:
        positionX = RamiaReevePositionX
        positionY = RamiaReevePositionY
    case .romaria:
        positionX = RamiaRomariaPositionX
        positionY = RamiaRomariaPositionY
    case .khoryv:
        positionX = RamiaKhoryvPositionX
        positionY = RamiaKhoryvPositionY
    case .norvik:
        positionX = RamiaNorvikPositionX
        positionY = RamiaNorvikPositionY
    case .asham:
        positionX = RamiaAshamPositionX
        positionY = RamiaAshamPositionY
    case .isis:
        positionX = RamiaIsisPositionX
        positionY = RamiaIsisPositionY
    case .portoga:
        positionX = RamiaPortogaPositionX
        positionY = RamiaPortogaPositionY
    case .baharata:
        positionX = RamiaBaharataPositionX
        positionY = RamiaBaharataPositionY
    case .alltrades_abbey:
        positionX = RamiaAlltradesSbbeyPositionX
        positionY = RamiaAlltradesSbbeyPositionY
    case .lanson:
        positionX = RamiaLansonPositionX
        positionY = RamiaLansonPositionY
    case .jipang:
        positionX = RamiaJipangPositionX
        positionY = RamiaJipangPositionY
    case .edina:
        positionX = RamiaEdinaPositionX
        positionY = RamiaEdinaPositionY
    case .manoza:
        positionX = RamiaManozaPositionX
        positionY = RamiaManozaPositionY
    case .persistence:
        positionX = RamiaPersistencePositionX
        positionY = RamiaPersistencePositionY
    default: break
    }
    
    return (positionX, positionY)
}
