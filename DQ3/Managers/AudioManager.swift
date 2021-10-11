//
//  AudioManager.swift
//  DQ3
//
//  Created by aship on 2020/12/17.
//

import AVFoundation

class AudioManager {
    static private var audioPlayer: AVAudioPlayer!
    static private var dqAudio: DQAudio = .none
    
    class func play(dqAudio: DQAudio) {
        if DebugStopBgm  {
            return
        }
        
        if dqAudio == .none {
            return
        }
        
        if dqAudio == self.dqAudio {
            return
        }
        
        let filename = dqAudio.rawValue
        let audioPath = Bundle.main.path(forResource: filename, ofType: "mp3")!
        let audioUrl = URL(fileURLWithPath: audioPath)
        
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
        } catch {}
        
        self.audioPlayer.numberOfLoops = -1
        self.audioPlayer.prepareToPlay()
        self.audioPlayer.play()
        self.dqAudio = dqAudio
    }
    
    class func stop() {
        if DebugStopBgm  {
            return
        }
        
        if self.dqAudio == .none {
            return
        }
        
        self.audioPlayer.stop()
        self.dqAudio = .none
    }
}
