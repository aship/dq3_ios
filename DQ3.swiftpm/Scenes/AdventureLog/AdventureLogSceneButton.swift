//
//  AdventureLogSceneButton.swift
//  DQ3
//
//  Created by aship on 2020/12/18.
//

import SpriteKit

extension AdventureLogScene {
    func padOverlayVirtualStickInteractionDidStart(_ padNode: PadOverlay) {
    }

    func padOverlayVirtualStickInteractionDidChange(_ padNode: PadOverlay) {
        self.padDirection = getDirection(
            stickPositionX: padNode.stickPosition.x,
            stickPositionY: padNode.stickPosition.y)
    }

    func padOverlayVirtualStickInteractionDidEnd(_ padNode: PadOverlay) {
        self.padDirection = .neutral
    }

    func willPress(_ button: ButtonOverlay) {
        if button == self.buttonA {
            self.adventureLogTopWindowNode?.processButtonA()
        }
    }

    func didPress(_ button: ButtonOverlay) {
    }
}
