//
//  BaseMapSceneNotification.swift
//  DQ3
//
//  Created by aship on 2021/01/02.
//

import GameController
import SpriteKit

extension BaseScene {
    func setupNotificationCenter() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.handleControllerDidConnectNotification(_:)),
            name: .GCControllerDidConnect,
            object: nil)
    }

    @objc func handleControllerDidConnectNotification(_ notification: NSNotification) {
        //        let sceneObject = notification.object as! GCController
        //
        //        registerCharacterMovementEvents(sceneObject)

        print("GCControllerDidConnect")

        guard let controller = notification.object as? GCController,
            let gamepad = controller.extendedGamepad
        else {
            return
        }

        print(String(describing: controller.vendorName))

        handleGameController(gamepad: gamepad)

    }

    //    private func registerCharacterMovementEvents(_ sceneObject: GCController) {
    //        // An analog movement handler for D-pads and thumbsticks.
    //        let movementHandler: GCControllerDirectionPadValueChangedHandler = { [unowned self] dpad, _, _ in
    //            self.controllerDPad = dpad
    //        }
    //
    //        // Gamepad D-pad
    //        if let gamepad = sceneObject.gamepad {
    //            gamepad.dpad.valueChangedHandler = movementHandler
    //        }
    //
    //        // Extended gamepad left thumbstick
    //        if let extendedGamepad = sceneObject.extendedGamepad {
    //            extendedGamepad.leftThumbstick.valueChangedHandler = movementHandler
    //        }
    //    }

}
