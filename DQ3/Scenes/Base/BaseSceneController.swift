//
//  BaseSceneController.swift
//  DQ3
//
//  Created by aship on 2021/01/02.
//

import GameController

extension BaseScene {
    func handleGameController(gamepad: GCExtendedGamepad) {
        // △ ○ × □
        var triangleButton: GCControllerButtonInput?
        var circleButton: GCControllerButtonInput?
        var crossButton:GCControllerButtonInput?
        var rectButton:GCControllerButtonInput?
        
        // ↑ ← ↓ → key
        var directionPad: GCControllerDirectionPad?
        
        // thumbstich
        var leftThumbstick: GCControllerDirectionPad?
        var rightThumbstick: GCControllerDirectionPad?
        var leftThumbstickButton: GCControllerButtonInput?
        var rightThumbstickButton: GCControllerButtonInput?
        
        // L1, L2, R1, R2　button
        var l1Button: GCControllerButtonInput?
        var l2Button: GCControllerButtonInput?
        var r1Button: GCControllerButtonInput?
        var r2Button: GCControllerButtonInput?
        
        // setting
        var optionsButton: GCControllerButtonInput?
        var shareButton: GCControllerButtonInput?
        
        // △ ○ × □
        rectButton = gamepad.buttonX
        triangleButton = gamepad.buttonY
        circleButton = gamepad.buttonB
        crossButton = gamepad.buttonA
        
        // ↑ ← ↓ → key
        directionPad = gamepad.dpad
        
        // thumbstich
        leftThumbstick = gamepad.leftThumbstick
        rightThumbstick = gamepad.rightThumbstick
        leftThumbstickButton = gamepad.leftThumbstickButton
        rightThumbstickButton = gamepad.rightThumbstickButton
        
        // L1, L2, R1, R2　button
        l1Button = gamepad.leftShoulder
        l2Button = gamepad.leftTrigger
        r1Button = gamepad.rightShoulder
        r2Button = gamepad.rightTrigger
        
        // setting
        optionsButton = gamepad.buttonMenu
        shareButton = gamepad.buttonOptions
        
        // △ ○ × □
        triangleButton?.pressedChangedHandler = { (input, value, isPressed) in
            guard isPressed else { return }
            
            print("press △")
        }
        
        circleButton?.pressedChangedHandler = { (input, value, isPressed) in
            guard isPressed else { return }
            
            self.willPress(self.buttonA)
            
            print("press ○")
        }
        
        crossButton?.pressedChangedHandler = { (input, value, isPressed) in
            guard isPressed else { return }
            
            self.willPress(self.buttonB)
            
            print("press ×")
        }
        
        rectButton?.pressedChangedHandler = { (input, value, isPressed) in
            guard isPressed else { return }
            
            print("press □")
        }
        
        // ↑ ← ↓ → key
        directionPad?.valueChangedHandler = {(_ dPad: GCControllerDirectionPad,
                                              _ x: Float,
                                              _ y: Float) -> Void in
            if x == 0 && y == 0 {
                self.padDirection = .neutral
                return
            }
            
            print("x: \(x), y: \(y)")
            
            if x == 1.0 {
                self.padDirection = .right
                print("→")
                return
            }
            
            if x == -1.0 {
                self.padDirection = .left
                print("←")
                return
            }
            
            if y == 1.0 {
                self.padDirection = .up
                print("↑")
                return
            }
            
            if y == -1.0 {
                self.padDirection = .down
                print("↓")
                return
            }
        }
        
        // thumbstich
        leftThumbstick?.valueChangedHandler = {(_ dpad: GCControllerDirectionPad,
                                                _ xValue: Float,
                                                _ yValue: Float) -> Void in
            print("left stick X: \(xValue)")
            print("left stick Y: \(yValue)")
        }
        
        rightThumbstick?.valueChangedHandler = {(_ dpad: GCControllerDirectionPad,
                                                 _ xValue: Float,
                                                 _ yValue: Float) -> Void in
            print("right stick X: \(xValue)")
            print("right stick Y: \(yValue)")
        }
        
        leftThumbstickButton?.valueChangedHandler = {(_ button: GCControllerButtonInput,
                                                      _ value: Float,
                                                      _ pressed: Bool) -> Void in
            if pressed {
                print("left thumbstick pressed")
            }
        }
        
        rightThumbstickButton?.valueChangedHandler = {(_ button: GCControllerButtonInput,
                                                       _ value: Float,
                                                       _ pressed: Bool) -> Void in
            if pressed {
                print("right thumbstick presded")
            }
        }
        
        // L1, L2, R1, R2　button
        l1Button?.valueChangedHandler = {(_ button: GCControllerButtonInput,
                                          _ value: Float,
                                          _ pressed: Bool) -> Void in
            if pressed {
                print("L1")
            }
        }
        
        l2Button?.valueChangedHandler = {(_ button: GCControllerButtonInput,
                                          _ value: Float,
                                          _ pressed: Bool) -> Void in
            if pressed {
                print("L2")
            }
        }
        
        r1Button?.valueChangedHandler = {(_ button: GCControllerButtonInput,
                                          _ value: Float,
                                          _ pressed: Bool) -> Void in
            if pressed {
                print("R1")
            }
        }
        
        r2Button?.valueChangedHandler = {(_ button: GCControllerButtonInput,
                                          _ value: Float,
                                          _ pressed: Bool) -> Void in
            if pressed {
                print("R2")
            }
        }
        
        // setting
        optionsButton?.valueChangedHandler = {(_ button: GCControllerButtonInput,
                                               _ value: Float,
                                               _ pressed: Bool) -> Void in
            if pressed {
                print("OPTIONS tapped")
            }
        }
        
        shareButton?.valueChangedHandler = {(_ button: GCControllerButtonInput,
                                             _ value: Float,
                                             _ pressed: Bool) -> Void in
            if pressed {
                print("share tapped")
            }
        }
    }
}
