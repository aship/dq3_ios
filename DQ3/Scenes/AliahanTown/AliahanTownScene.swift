//
//  AliahanTownScene.swift
//  DQ3
//
//  Created by aship on 2020/12/09.
//

import SpriteKit

class AliahanTownScene: BaseMapScene,
                        PadOverlayDelegate,
                        ButtonOverlayDelegate {
    enum OpeningStateFlag {
        case none
        case mother_moving
        case mother_moved
        case message_one_start
        case message_one_end
        case message_two_start
        case message_two_end
        case finished
    }
    
    var openingStateFlag: OpeningStateFlag = .none
    
    let greenBGColor = UIColor(red: 166 / 255,
                               green: 226 / 255,
                               blue: 70 / 255,
                               alpha: 1)
    override init() {
        super.init()
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
        self.backgroundColor = self.greenBGColor
        
        addMainTileMap(name: "aliahan_town",
                       tileMapNode: &self.mainTileMapNode,
                       numberOfImages: 60,
                       scale: self.scale)
        
        addInsideTileMap(name: "aliahan_town_inside",
                         mainTileMapNode: self.mainTileMapNode,
                         insideTileMapNode: &self.insideTileMapNode,
                         numberOfImages: 66)
        
        if DataManager.showInsideMap {
            showInsideTileMap()
            
            DataManager.showInsideMap = false
        }
        
        addPartyCharacters(tileMapNode: self.mainTileMapNode,
                           scale: self.scale)
        
        
        addNpcCharacters(tileMapNode: self.mainTileMapNode,
                         dqStory: DataManager.dqStory,
                         scale: self.scale)
        
        setupVirtualPad(leftPad: self.leftPad,
                        buttonA: self.buttonA,
                        buttonB: self.buttonB)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            AudioManager.play(dqAudio: .town)
        }
        
        if DataManager.dqStory == .opening {
            self.openingStateFlag = .mother_moving
            
            let headNode = DataManager.adventureLog.partyCharacterNodes.first!
            headNode.setMoveProhibited()
            
            motherAndHeroMove(completion: {
                self.openingStateFlag = .message_one_start
                
                let headNode = DataManager.adventureLog.partyCharacterNodes.first!
                headNode.positionX = AliahanTownMotherWaitingPositionX - 1
                headNode.positionY = AliahanTownMotherWaitingPositionY
                
                let text1 = "＊「ここから　まっすぐいくと"
                let text2 = "　　おしろ　です。"
                
                self.mapMessageWindowNode = MapMessageWindowNode()
                self.mapMessageWindowNode.showMessages(
                    scene: self,
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
            })
        }
    }
}