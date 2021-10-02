//
//  FieldScene.swift
//  TestSwift
//
//  Created by aship on 2020/10/21.
//

import SpriteKit

class FieldScene: BaseMapScene,
                  PadOverlayDelegate,
                  ButtonOverlayDelegate {
    var enterBattlePoint = 0
    
    override init() {
        super.init()
        
        self.heroPositionX = FieldAliahanPositionX
        self.heroPositionY = FieldAliahanPositionY
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        self.leftPad.delegate = self
        self.buttonA.delegate = self
        self.buttonB.delegate = self
    }
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .black
        
        addMainTileMap(name: "field",
                       tileMapNode: &self.mainTileMapNode,
                       numberOfImages: 45,
                       scale: self.scale)
        
        addPartyCharacters(tileMapNode: self.mainTileMapNode,
                           scale: self.scale)
        
        setupVirtualPad(leftPad: self.leftPad,
                        buttonA: self.buttonA,
                        buttonB: self.buttonB)
        
        AudioManager.play(dqAudio: .field)
    }
}
