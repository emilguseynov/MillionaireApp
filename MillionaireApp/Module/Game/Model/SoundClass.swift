//
//  SoundClass.swift
//  MillionaireApp
//
//  Created by Андрей Бородкин on 09.02.2023.
//

import Foundation
import AVFoundation

class SoundClass {
    
    static var player = AVAudioPlayer()
    
    let shared = SoundClass()
    private init() {}
    
    
    enum Sound: String {
        
        case questionTimer = "question-timer"
        case answerIsCorrect = "otvet-vernyiy-5267_2"
        case answerIsWrong = "zvuk-nepravilnogo-otveta-vkto-hochet-stat-millionerom-5270_6"
        case intrigue = "otvet-prinyat-teper-govorit-veduschiy-5266-1_7"
        case won = "bolee-kachestvennyiy-zvuk-mojet-on-vam-nujen-5284_8"
    }
    
   
    
    static func playSound(resource: Sound) {
        let url = Bundle.main.url(forResource: resource.rawValue, withExtension: "mp3")
    
        guard let url = url else {return}
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch {
            print(error)
        }
        
    }
    
    static func stopSound() {
        player.stop()
    }
}
