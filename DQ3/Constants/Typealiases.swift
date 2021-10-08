//
//  Typealiases.swift
//  DQ3
//
//  Created by aship on 2021/01/01.
//

import SpriteKit

typealias CheckCanMove = (_ node: SKTileMapNode, _ x: Int, _ y: Int) -> Bool
typealias CheckPosition = (_ x: Int, _ y: Int) -> Void

typealias WillPress = (_ button: ButtonOverlay) -> Void

typealias ProcessTalk = (_ headNode: CharacterNode) -> (Bool, String, String?, String?)
