//
//  MonsterNode.swift
//  DQ3
//
//  Created by aship on 2021/05/21.
//

import SpriteKit

class MonsterNode: SKSpriteNode {
    private(set) var dqMonsterType: DQMonsterType = .slime
    private(set) var hp = 0
    private(set) var mp = 0
    private(set) var exp = 0
    private(set) var gold = 0

    init(dqMonsterType: DQMonsterType) {
        self.dqMonsterType = dqMonsterType

        var size = CGSize(
            width: 16,
            height: 16)

        if dqMonsterType == .horned_rabbit {
            // いっかくうさぎ
            size = CGSize(
                width: 40,
                height: 32)
        }

        super.init(
            texture: nil,
            color: .clear,
            size: size)

        let imageName = "monster/\(dqMonsterType).png"
        self.texture = SKTexture(imageNamed: imageName)

        if dqMonsterType == .slime {
            // スライム
            self.hp = 8
            self.mp = 0
            self.exp = 2
            self.gold = 3
        } else if dqMonsterType == .black_raven {
            // おおがらす
            self.hp = 9
            self.mp = 0
            self.exp = 3
            self.gold = 4
        } else if dqMonsterType == .horned_rabbit {
            // いっかくうさぎ
            self.hp = 10
            self.mp = 0
            self.exp = 4
            self.gold = 6
        } else {
            self.hp = 110
            self.mp = 222
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setDamage(damage: Int) {
        self.hp -= damage
    }

    func getCurrentHp() -> Int {
        return self.hp
    }
}
