//
//  BaseMapScene.swift
//  DQ3
//
//  Created by aship on 2020/12/18.
//

import SpriteKit

class BaseMapScene: BaseScene,
    PadOverlayDelegate,
    ButtonOverlayDelegate
{
    let blackScreenNode = SKSpriteNode()

    var openingScene: OpeningScene!
    var aliahanTownScene: AliahanTownScene!
    var aliahanTownHouseScene: AliahanTownHouseScene!

    override func sceneDidLoad() {
        super.sceneDidLoad()

        self.leftPad.delegate = self
        self.buttonA.delegate = self
        self.buttonB.delegate = self

        self.leftPad.zPosition = 10
        self.buttonA.zPosition = 10
        self.buttonB.zPosition = 10

        self.blackScreenNode.size = CGSize(
            width: ScreenWidth,
            height: ScreenHeight)
        self.blackScreenNode.color = .black
        self.blackScreenNode.alpha = 0.0
        self.blackScreenNode.zPosition = 9
        self.addChild(blackScreenNode)
    }

    override func didMove(to view: SKView) {
        setupDQMapScene(dqSceneType: DataManager.dqSceneType)

        setupVirtualPad(
            leftPad: self.leftPad,
            buttonA: self.buttonA,
            buttonB: self.buttonB)
    }
}
