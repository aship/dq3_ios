//
//  AdventureLogFunctions.swift
//  DQ3
//
//  Created by aship on 2021/04/15.
//

import SpriteKit

func reloadAdventureLogScene() {
    let adventureLog1 = UserDefaultsUtil.loadAdventureLog(number: 1)
    let adventureLog2 = UserDefaultsUtil.loadAdventureLog(number: 2)
    let adventureLog3 = UserDefaultsUtil.loadAdventureLog(number: 3)

    let numberOfAdventureLogs = getNumberOfAdventureLogs(
        adventureLog1: adventureLog1,
        adventureLog2: adventureLog2,
        adventureLog3: adventureLog3)

    DataManager.scene.adventureLogScene?.adventureLogTopWindowNode?.removeFromParent()
    DataManager.scene.adventureLogScene?.adventureLogTopWindowNode = AdventureLogTopWindowNode()
    DataManager.scene.adventureLogScene?.adventureLogTopWindowNode?.addToScene(
        scene: DataManager.scene,
        numberOfAdventureLogs: numberOfAdventureLogs,
        scale: DataManager.scene.scale)
}

func getNumberOfAdventureLogs(
    adventureLog1: AdventureLog?,
    adventureLog2: AdventureLog?,
    adventureLog3: AdventureLog?
) -> Int {
    var numberOfAdventureLogs = 0

    if adventureLog1 != nil {
        numberOfAdventureLogs += 1
    }

    if adventureLog2 != nil {
        numberOfAdventureLogs += 1
    }

    if adventureLog3 != nil {
        numberOfAdventureLogs += 1
    }

    return numberOfAdventureLogs
}
