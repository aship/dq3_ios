//
//  BaseScene.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

class BaseScene: SKScene,
    PadOverlayDelegate,
    ButtonOverlayDelegate
{
    var fieldMoveMode: FieldMoveMode = .walk
    var ramiaDirection: Direction = .neutral

    let scale = CGFloat(ScreenHeight / 240)

    let leftPad = PadOverlay()
    let buttonA = ButtonOverlay("A")
    let buttonB = ButtonOverlay("B")

    var padDirection: Direction = .neutral

    let blackScreenNode = SKSpriteNode()

    var titleScene: TitleScene?
    var adventureLogScene: AdventureLogScene?
    var openingScene: OpeningScene?
    var aliahanTownScene: AliahanTownScene?
    var aliahanTownHouseScene: AliahanTownHouseScene?
    var fieldScene: FieldScene?
    var alltradesAbbeyScene: AlltradesAbbeyScene?

    override func sceneDidLoad() {
        setupNotificationCenter()

        self.scaleMode = .resizeFill
        self.anchorPoint = CGPoint(
            x: 0.5,
            y: 0.5)

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
        self.blackScreenNode.zPosition = ZPositionBlackScreen
        self.addChild(blackScreenNode)
    }

    override func didMove(to view: SKView) {
        let dqMainState = DataManager.dqMainState
        let dqSceneType = DataManager.adventureLog.dqSceneType

        setupDQScene(
            dqMainState: dqMainState,
            dqSceneType: dqSceneType)

        setupVirtualPad(
            leftPad: self.leftPad,
            buttonA: self.buttonA,
            buttonB: self.buttonB)
    }
}
