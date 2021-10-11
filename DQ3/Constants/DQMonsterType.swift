//
//  DQMonsterType.swift
//  DQ3
//
//  Created by aship on 2021/05/19.
//

enum DQMonsterType {
    case next_page // 次ページ(モンスターではなく制御用)
    case slime // スライム
    case black_raven // おおがらす
    case horned_rabbit //いっかくうさぎ
}

func getDQMonsterTypeNameFrom(dqMonsterType: DQMonsterType) -> String {
    var name: String!
    
    switch dqMonsterType {
    case .next_page: name = "next"
    case .slime: name = "スライム"
    case .black_raven: name = "おおがらす"
    case .horned_rabbit: name = "いっかくうさぎ"
    }
    
    return name
}



//1よりも妙な名前のモンスターが増えましたね。 直訳が難しいモンスターには？を付けました
//アークマージ Archmage 大魔法使い
//アカイライ Blue Beak 青い口
//アニマルゾンビ Putrepup ？
//暴れ猿 Wild Ape 野生類人猿
//怪しい影 Shadow 影
//アルミラージ Spiked Hare スパイクつき野ウサギ
//アントベア Tonguebear 舌の熊

//動く石像 Stone Hulk 石の廃船
//エビルマージ Evil Mage 悪い魔法使い
//エリミネーター Eliminator 除去者
//大ありくい Giant Anteater オオアリクイ

//大クチバシ Great Beak 大きな口
//オックスベア Rammore ラモラー？
//踊る宝石 Dancing Jewel 踊る宝石
//お化けありくい Demon Anteater 悪魔アリクイ
//お化けキノコ Demon Toadstool 悪魔毒キノコ
//骸骨剣士 Skeleton 骸骨
//火炎ムカデ Flamepede 火炎ムカデ
//ガニラス Crabus クラブス
//ガメゴン Tortagon ？
//ガメゴンロード King Tortagon ？
//ガルーダ Garuda ガルーダ
//カンダタ Kandar カンダタ
//カンダタ子分 KandarHenchman カンダタ従僕
//ギズモ Gas Cloud ガス雲
//キメラ Wyvern ワイバーン
//鬼面道士 Deranger デランガー？
//キャタピラー Caterpillar キャタピラー
//キャットバット Catula 猫ウラ？
//キャットフライ Vampire Cat 吸血鬼猫
//キラーアーマー Lethal Armor 致死甲冑
//キラーエイプ Simiac シミアク？
//キラービー Killer Bee 殺人ミツバチ
//ダースリカント Darthbear ダース熊
//キングヒドラ King Hydra キングヒドラ
//グール Ghoul 悪鬼
//腐った死体 Hork ホーク?
//クラーゴン Kragacles ？
//グリズリー Grizzly グリズリー
//軍隊ガニ Army Crab 軍隊カニ
//幻術士 Nev ネヴ？
//ゴートドン Goategon ゴートゴン？
//ゴールドマン Gold Basher 金の強打者
//ごうけつ熊 Fierce Bear 猛烈な熊
//こうもり男 Humanabat ヒューマナ・バット
//極楽鳥 Elysium Bird エリジアムバード
//コング Kong コング
//殺人鬼 Executioner 死刑執行人
//さそりばち Scorpion Wasp サソリワスプ
//サタンパピー Winged Demon 翼のある悪魔
//さまよう鎧 Rogue Knight 悪者の騎士
//サラマンダー Salamander 火のトカゲ
//地獄の騎士 Marauder 略奪者
//地獄のはさみ Infernus Crab インフェルナスのカニ
//地獄の鎧 Infernus Knight インフェルナスの騎士
//しびれくらげ Man O'War マナウォー
//しびれあげは Stingwing スティングの翼
//シャーマン Witch Doctor 妖術師
//シャドー Terror Shadow 恐怖影
//人面蝶 Masked Moth 隠れた蛾
//スカイドラゴン Sky Dragon 空のドラゴン
//スカルゴン Putregon Putregon ？
//スノードラゴン Snow Dragon 雪ドラゴン
//スライムつむり Slime Snail 軟泥カタツムリ
//スライムベス Red Slime 赤い軟泥
//ソードイド Swordoid ソードイド
//ゾーマ Zoma ゾーマ
//ゾンビマスター Voodoo Shaman ブーズー教シャーマン
//大王イカ King Squid 王イカ
//大王ガマ King Froggore 王フロッガー
//だいまじん Granite Titan 花崗岩タイタン
//デスジャッカル Avenger Jackal 復讐者ジャッカル
//デスストーカー Avenger 復讐者
//デスフラッター Avenger Raven 復讐者ワタリガラス
//デッドペッカー Avenger Beak 復讐者口
//テンタクルス Tentacles 触手
//毒イモムシ Poison Silkworm 毒カイコ
//どくどくゾンビ Venom Zombie 毒ゾンビ
//ドラゴン Grenn Dragon 緑ドラゴン
//ドラゴンゾンビ Scalgon スカルゴン
//ドルイド Lumpus ルムプス？
//トロル Troll トロル
//トロルキング Troll King トロル王
//バーナバス Barnabas バーナバス
//爆弾岩 Bomb Crag 爆弾断崖
//はぐれメタル Metal Babble 金属泡
//バブルスライム Babbble 泥
//バラモス Baramos バラモス
//バラモスゾンビ Baramos Gonus ？
//バラモスブロス Baramos Bomus ？
//バリイドドッグ Madhound 狂気の猟犬
//バルログ Barog バルログ
//ハンターフライ Hunter Fly ハンターハエ
//バンパイア Vampire 吸血鬼
//ヒートギズモ Heat Cloud 熱雲
//ビッグホーン Bighorn オオツノヒツジ
//ヒドラ Hydra ヒドラ
//氷河魔人 Glacier Blasher 氷河強打者
//人食い蛾 Man-Eater Moth 人食い蛾
//人食い箱 Man-Eater Chest 人食い胸
//フロストギズモ Frost Cloud フロスト雲
//フロッガー Froggore フロッガー
//ベビーサタン Demonite デーモニテ？
//ベホマスライム Curer 治療者
//ヘルコンドル Hades' Condor ハデスコンドル
//ポイズントード Poison Toad 毒ヒキガエル
//ホイミスライム Healer 治療者
//ボストロール Boss Troll 上司輪唱
//ホロゴースト Hologhost ホロゴースト
//マーマン Merzon マーゾン
//マーマンキング King Merzon キングマーゾン
//マーマンダイン Merzoncian マーゾンシアン
//魔王の影 Vile Shadow 下劣な影
//マクロベータ Voodoo Warlock ブーズー教魔法使い
//魔女 Witch 魔女
//マタンゴ Deadly Toadstool 致命的な毒キノコ
//マドハンド Goopi グーピ？
//魔法おばば Old Hag 古い悪婆
//魔法使い Magician 魔術師
//マミー Mimmy マミー
//マリンスライム Maline Slime マリーヌ軟泥
//マントゴーア Lionroar ライオンの咆哮
//ミイラ男 Mummy Man ミイラ男
//ミニデーモン Minidemon ミニ悪魔
//ミミック Mimic 模倣
//メイジキメラ Magiwyvern 魔法使いワイバーン
//メイジマタンゴ Mage Toadstool 魔法使い毒キノコ
//メタルスライム Metal Slime 金属軟泥
//やまたのおろち Orochi おろち
//溶岩魔人 Lava Basher 溶岩強打者
//ライオンヘッド Lionhead ライオン頭
//ラゴンヌ Leona レオーナ
//笑い袋 Trick Bag 策略バッグ
//鳳凰 Phoenix フェニックス
//天の門番 GateGuard 門のガード
//メタルキメラ MtlWyvern メタルワイバーン
//デビルウィザード DevilMage 悪魔魔法使い
//キラークラブ EvilCrab 有害なカニ
//ダークトロル DarkTroll 暗い輪唱
//デーモンソード DemonSwrd デーモンソード
//神竜 Divinegon ディバインゴン？
//シルバーベア Gray Bear 灰色熊
//ホワイトライオン White Lion 白いライオン
//キースドラゴン BlueDragn BlueDragn
//パンドラボックス Doras box ドーラの箱
//アイアンナイト Iron Nite 鉄のナイト
//ダースドラゴン Red Dragon 赤いドラゴン
//メタルハンド Mtl Goopi メタルグーピ？
//ダースギズモ Evil Cloud 有害な雲
//鋼鉄の巨像 Steel Hulk スチール廃船
//グランドラゴーン Gran Dragn 祖母ドラゴーン




