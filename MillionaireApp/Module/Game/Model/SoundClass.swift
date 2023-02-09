//
//  SoundClass.swift
//  MillionaireApp
//
//  Created by Андрей Бородкин on 09.02.2023.
//

import Foundation
import AVFoundation

struct SoundClass {
    
    static var player = AVAudioPlayer()
    
    static func playSound() {
    
      
        
        let url = Bundle.main.url(forResource: "zvuk", withExtension: "mp3")
    
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
