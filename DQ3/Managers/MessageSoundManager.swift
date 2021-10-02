//
//  MessageSoundManager.swift
//  DQ3
//
//  Created by aship on 2021/05/17.
//

import AVFoundation

class MessageSoundManager {
    static private var audioPlayer: AVAudioPlayer!
    
    class func play() {
        let filename = "message"
        let audioPath = Bundle.main.path(forResource: filename, ofType: "mp3")!
        let audioUrl = URL(fileURLWithPath: audioPath)
        
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
        } catch {}
        
        self.audioPlayer.numberOfLoops = 0
        self.audioPlayer.prepareToPlay()
        self.audioPlayer.play()
    }
}
