//
//  BattleSceneMonster.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

extension BattleScene {
    func addEnemies() {
        // ここで、ポジションからテーブルで
        // 出てくる敵リストを参照。。。どうやって？
        // スライム4
        // スライム3
        // スライム1
        // おおがらす2
        // おおがらす3
        // スライム1 おおがらす 1
        // スライム1 おおがらす 2
        // スライム2 おおがらす 1
        // スライム5 おおがらす 2
        // 夜だから？
        // スライム3 おおがらす 3
        
        // たとえばスライム3匹だとどうなる。。。
        self.dqMonsterTypeHash = [.slime: 1]
        
//        self.dqMonsterTypeHash = [.slime: 3,
//                                  .horned_rabbit: 2]
//
        
        var index = 0
        
        for (dqMonsterType, numberOfMonsters) in self.dqMonsterTypeHash {
            //     print("PPP \(dqMonsterType) is \(numberOfMonsters)")
            
            var monsterGroup = MonsterGroup(dqMonsterType: dqMonsterType)
            
            self.monsterGroups.append(monsterGroup)
            
            //     var monsterGroup = addMonsterGroup(dqMonsterType: dqMonsterType)
            
            for _ in 0 ..< numberOfMonsters {
                print(index)
                
                print("dqMOnsterType \(dqMonsterType)")
                
                addMonster(dqMonsterType: dqMonsterType,
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
    
    private func addMonster(dqMonsterType: DQMonsterType,
                            monsterGroup: inout MonsterGroup,
                            index: Int,
                            leftX: Int,
                            scale: CGFloat) {
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
