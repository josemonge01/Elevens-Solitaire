//
//  AudioPlayer.swift
//  Elevens Solitaire
//
//  Created by Jose Monge on 5/21/21.
//

import Foundation
import AVFoundation

class AudioPlayer {
    
    /*=========================================================
 
                            Properties
 
    =========================================================*/
    
    var startSound: AVAudioPlayer?
    var successSound1: AVAudioPlayer?
    var successSound2: AVAudioPlayer?
    var failSound1: AVAudioPlayer?
    var failSound2: AVAudioPlayer?
    var winSound: AVAudioPlayer?
    var loseSound: AVAudioPlayer?
    var specialWinSound: AVAudioPlayer?
    
    
    /*=========================================================
 
                        Loading Functions
 
    =========================================================*/
    
    init() {
        
        guard let startURL = Bundle.main.url(forResource: "start", withExtension: "m4a") else {
            print("Resource not found")
            return
        }
        do {
            startSound = try AVAudioPlayer(contentsOf: startURL)
        } catch {
            print("Error getting start sound")
        }
        
        guard let successURL = Bundle.main.url(forResource: "success", withExtension: "m4a") else {return}
        do {
            successSound1 = try AVAudioPlayer(contentsOf: successURL)
            successSound2 = try AVAudioPlayer(contentsOf: successURL)
        } catch {
            print("Error getting success sound")
        }
        
        guard let failURL = Bundle.main.url(forResource: "fail", withExtension: "m4a") else {return}
        do {
            failSound1 = try AVAudioPlayer(contentsOf: failURL)
            failSound2 = try AVAudioPlayer(contentsOf: failURL)
        } catch {
            print("Error getting fail sound")
        }
        
        guard let winURL = Bundle.main.url(forResource: "win", withExtension: "m4a") else {return}
        do {
            winSound = try AVAudioPlayer(contentsOf: winURL)
        } catch {
            print("Error getting win sound")
        }
        
        guard let loseURL = Bundle.main.url(forResource: "lose", withExtension: "m4a") else {return}
        do {
            loseSound = try AVAudioPlayer(contentsOf: loseURL)
        } catch {
            print("Error getting lose sound")
        }
        
        guard let specialWinURL = Bundle.main.url(forResource: "special_win", withExtension: "m4a") else {return}
        do {
            specialWinSound = try AVAudioPlayer(contentsOf: specialWinURL)
        } catch {
            print("Error getting sound")
        }
    }
    
    /*=========================================================
 
                        Sound Functions
 
    =========================================================*/
    
    func playStartSound() {
        startSound?.play()
    }
    
    func playSuccessSound() {
        
        if successSound1 == nil || successSound2 == nil {return}
        
        if !successSound1!.isPlaying {
            successSound1!.play()
        } else {
            successSound2!.play()
        }
    }
    
    func playFailSound() {
        
        if failSound1 == nil || failSound2 == nil {return}
        
        if !failSound1!.isPlaying {
            failSound1!.play()
        } else {
            failSound2!.play()
        }
    }
    
    func playWinSound() {
        winSound?.play()
    }
    
    func playLoseSound() {
        loseSound?.play()
    }
    
    func playSpecialWinSound() {
        specialWinSound?.play()
    }
}
