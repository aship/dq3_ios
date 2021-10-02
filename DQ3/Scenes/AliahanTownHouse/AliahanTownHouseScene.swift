//
//  AliahanTownHouseScene.swift
//  DQ3
//
//  Created by aship on 2020/12/14.
//

import SpriteKit

class AliahanTownHouseScene: BaseMapScene,
                             PadOverlayDelegate,
                             ButtonOverlayDelegate {
    enum OpeningStateFlag {
        case none
        case message_one_start
        case message_one_end
        case message_two_start
        case message_two_end
        case message_three_start
        case mother_moved
        case mother_start_escorting
    }
    
    var openingStateFlag: OpeningStateFlag = .none
    
    let motherNode = SKSpriteNode(imageNamed: "\(ImagePathLady)/down1.png")
    
    override init() {
        super.init()
        
        self.heroPositionX = AliahanTownHouseMotherPositionX
        self.heroPositionY = AliahanTownHouseMotherPositionY - 1
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
        self.backgroundColor =  UIColor.rgba(red: 71,
                                             green: 192,
                                             blue: 252,
                                             alpha: 1)
        addMainTileMap(name: "aliahan_town_house",
                       tileMapNode: &self.mainTileMapNode,
                       numberOfImages: 9,
                       scale: self.scale)
        
        addPartyCharacters(tileMapNode: self.mainTileMapNode,
                           scale: self.scale)
        
        addNpcCharacters(tileMapNode: self.mainTileMapNode,
                         scale: self.scale)
        
        setupVirtualPad(leftPad: self.leftPad,
                        buttonA: self.buttonA,
                        buttonB: self.buttonB)
        
        AudioManager.play(dqAudio: .town)
        
        if dqStory == .opening {
            setMoveProhibited()
            
            let text1 = "＊「おはよう　えにくす。"
            let text2 = "　　もう　あさですよ。"
            
            self.mapMessageWindowNode = MapMessageWindowNode()
            self.mapMessageWindowNode.showMessages(
                scene: scene!,
                text1: text1,
                text2: text2,
                text3: nil,
                withSe: true,
                withNextMark: true,
                pointX: MapMessageWindowChildOfScenePointX,
                pointY: MapMessageWindowChildOfScenePointY,
                scale: self.scale,
                completion: {
                    self.openingStateFlag = .message_one_end
                })
        }
    }
}
