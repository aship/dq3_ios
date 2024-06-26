//
//  BattleSceneMonster.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import CoreLocation
import SpriteKit

extension BattleScene {
    func addMonsters() {
        // ここで、ポジションからテーブルで
        // 出てくる敵リストを参照。。。どうやって？
        // スライム1
        // スライム3
        // スライム4
        // おおがらす2
        // おおがらす3
        // スライム1 おおがらす 1
        // スライム1 おおがらす 2
        // スライム2 おおがらす 1
        // スライム5 おおがらす 2
        // 夜だから？
        // スライム3 おおがらす 3

        // マップの座標を取得。。。。
        let headNode = DataManager.adventureLog.partyCharacterNodes.first!
        let positionX = headNode.positionX
        let positionY = headNode.positionY

        // field or alefgard
        //let dqScene = DataManager.adventureLog.dqSceneType

        // sea or field ?
        // DataManager.scene.fieldMoveMode == .ship

        var battleArea: BattleArea = .aliahan_west
        // ある範囲に対して
        //        let leftX = 100
        //        let rightX = 200
        //        let upY = 100
        //        let downY = 10

        if 120 < positionX {
            battleArea = .aliahan_east
        }

        // Pos X Y がこの矩形内に収まる場合
        if battleArea == .aliahan_east {
            let randomValue = 0  //Int.random(in: 0 ... 2)

            if randomValue == 0 {
                self.dqMonsterTypeHash = [.slime: 1]
            } else if randomValue == 1 {
                self.dqMonsterTypeHash = [.slime: 2]
            } else if randomValue == 2 {
                self.dqMonsterTypeHash = [.slime: 3]
            }
        } else if battleArea == .aliahan_west {
            let randomValue = Int.random(in: 3...8)

            if randomValue == 3 {
                self.dqMonsterTypeHash = [.horned_rabbit: 2]
            } else if randomValue == 4 {
                self.dqMonsterTypeHash = [.horned_rabbit: 3]
            } else if randomValue == 5 {
                self.dqMonsterTypeHash = [
                    .slime: 1,
                    .horned_rabbit: 1,
                ]
            } else if randomValue == 6 {
                self.dqMonsterTypeHash = [
                    .slime: 1,
                    .horned_rabbit: 2,
                ]
            } else if randomValue == 7 {
                self.dqMonsterTypeHash = [
                    .slime: 2,
                    .horned_rabbit: 1,
                ]
            } else if randomValue == 8 {
                self.dqMonsterTypeHash = [
                    .slime: 5,
                    .horned_rabbit: 2,
                ]
            }
        }

        var index = 0

        for (dqMonsterType, numberOfMonsters) in self.dqMonsterTypeHash {
            //     print("PPP \(dqMonsterType) is \(numberOfMonsters)")

            var monsterGroup = MonsterGroup(dqMonsterType: dqMonsterType)

            self.monsterGroups.append(monsterGroup)

            //     var monsterGroup = addMonsterGroup(dqMonsterType: dqMonsterType)

            for _ in 0..<numberOfMonsters {
                print(index)

                print("dqMOnsterType \(dqMonsterType)")

                addMonster(
                    dqMonsterType: dqMonsterType,
                    monsterGroup: &monsterGroup,
                    index: index,
                    leftX: 64,
                    scale: self.scene.scale)

                index += 1
            }
        }
        //
        //        for monsterGroup in self.monsterGroups {
        //            print("monsterNodes.count \(monsterGroup.monsterNodes.count)")
        //        }
    }

    private func addMonster(
        dqMonsterType: DQMonsterType,
        monsterGroup: inout MonsterGroup,
        index: Int,
        leftX: Int,
        scale: CGFloat
    ) {
        let node = MonsterNode(dqMonsterType: dqMonsterType)

        // 左下基準
        node.anchorPoint = CGPoint(x: 0.0, y: 0.0)

        let pointX: CGFloat = CGFloat(-30 + 30 * index) * scale
        let pointY: CGFloat = -16 * scale

        node.setScale(scale)
        node.position = CGPoint(x: pointX, y: pointY)

        self.scene.addChild(node)

        monsterGroup.apendMonsterNode(monsterNode: node)
    }

    func checkSomeMonstersAlive() -> Bool {
        for monsterGroup in self.monsterGroups {
            let isSomeMonstersAlive = monsterGroup.checkSomeMonstersAlive()

            if isSomeMonstersAlive {
                return true
            }
        }

        return false
    }
}
