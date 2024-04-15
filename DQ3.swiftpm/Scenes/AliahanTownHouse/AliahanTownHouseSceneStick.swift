//
//  AliahanTownHouseSceneStick.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

extension AliahanTownHouseScene {
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
}
