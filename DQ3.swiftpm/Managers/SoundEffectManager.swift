//
//  SoundEffectManager.swift
//  DQ3
//
//  Created by aship on 2021/03/21.
//

import AVFoundation

class SoundEffectManager {
    static private var audioPlayer: AVAudioPlayer!

    class func play(_ soundEffect: DQSoundEffect) {
        let filename = soundEffect.rawValue
        let audioUrl = Bundle.module.url(
            forResource: "mp3/se/" + filename,
            withExtension: "mp3")!
        //  let audioUrl = URL(fileURLWithPath: audioPath)

        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
        } catch {}

        self.audioPlayer.numberOfLoops = 0
        self.audioPlayer.prepareToPlay()
        self.audioPlayer.play()
    }
}
