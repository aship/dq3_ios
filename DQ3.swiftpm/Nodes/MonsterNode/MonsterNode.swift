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

    init(dqMonsterType: DQMonsterType) {
        self.dqMonsterType = dqMonsterType

        let size = CGSize(
            width: 16,
            height: 16)

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
        } else if dqMonsterType == .black_raven {
            // おおがらす
            self.hp = 9
            self.mp = 0
        } else if dqMonsterType == .horned_rabbit {
            // いっかくうさぎ
            self.hp = 10
            self.mp = 0
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
