//
//  CharacterAnimation.swift
//  DQ3
//
//  Created by aship on 2020/12/30.
//

import SpriteKit

func getCharacterAnimationAction(
    direction: Direction,
    dqCharacter: DQCharacter
) -> SKAction {
    var type = ""

    if dqCharacter.rawValue == "ship" || dqCharacter.rawValue == "ramia" {
        type = "vehicle"
    } else {
        let characterString = dqCharacter.rawValue
        let vocatinString = characterString.components(separatedBy: "_").first!

        let dqVocation = DQVocation(rawValue: vocatinString)

        if dqVocation == nil {
            type = "npc"
        } else {
            type = "vocation"
        }
    }

    let imagePath = "character/\(type)/\(dqCharacter.rawValue)"

    let imageName1 = "\(imagePath)/\(direction.rawValue)1.png"
    let texture1 = SKTexture(imageNamed: imageName1)

    let imageName2 = "\(imagePath)/\(direction.rawValue)2.png"
    let texture2 = SKTexture(imageNamed: imageName2)

    let textures = [texture1, texture2]

    let action = SKAction.animate(
        with: textures,
        timePerFrame: 1 / 4)

    let repeatAction = SKAction.repeatForever(action)

    return repeatAction
}
