//
//  GameAlertView.swift
//  Elevens Solitaire
//
//  Created by Jose Monge on 2/1/21.
//

import Foundation
import UIKit

/**
===================================== PAUSE MENU VIEW =====================================
 */

class PauseMenuView: UIView {
    
    /*=========================================================
 
                            Properties
 
    =========================================================*/
    
    let titleLabel = UILabel()
    let resumeButton = ElevensButton()
    let newGameButton = ElevensButton()
    let howToPlayButton = ElevensButton()
    let quitButton = ElevensButton()
    
    let spacing: CGFloat = 10
    var delegate: MenuViewDelegate?
    
    
    /*=========================================================
 
                        Loading Functions
 
    =========================================================*/
    
    func load() {
        
        //view
        backgroundColor = .white
        layer.borderWidth = 10
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 15
        
        //titleLabel
        titleLabel.text = "menu_pause".localized
        titleLabel.font = ElevensStyle.subtitleFont
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 2 * spacing).isActive = true
        
        //resumeButton
        resumeButton.load(title: "button_resume".localized)
        resumeButton.tag = 0
        resumeButton.addTarget(self, action: #selector(buttonPushed(_:)), for: .touchUpInside)
        resumeButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(resumeButton)
        
        resumeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        resumeButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: spacing).isActive = true
        resumeButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: resumeButton.mediumWidthMult).isActive = true
        resumeButton.heightAnchor.constraint(equalTo: resumeButton.widthAnchor, multiplier: resumeButton.heightMult).isActive = true
        
        //newGameButton
        newGameButton.load(title: "button_new_game".localized)
        newGameButton.tag = 1
        newGameButton.addTarget(self, action: #selector(buttonPushed(_:)), for: .touchUpInside)
        newGameButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(newGameButton)
        
        newGameButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        newGameButton.topAnchor.constraint(equalTo: resumeButton.bottomAnchor, constant: spacing).isActive = true
        newGameButton.widthAnchor.constraint(equalTo: resumeButton.widthAnchor).isActive = true
        newGameButton.heightAnchor.constraint(equalTo: resumeButton.heightAnchor).isActive = true
        
        //howToPlayButton
        howToPlayButton.load(title: "button_how_to_play".localized)
        howToPlayButton.tag = 2
        howToPlayButton.addTarget(self, action: #selector(buttonPushed(_:)), for: .touchUpInside)
        howToPlayButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(howToPlayButton)
        
        howToPlayButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        howToPlayButton.topAnchor.constraint(equalTo: newGameButton.bottomAnchor, constant: spacing).isActive = true
        howToPlayButton.widthAnchor.constraint(equalTo: resumeButton.widthAnchor).isActive = true
        howToPlayButton.heightAnchor.constraint(equalTo: resumeButton.heightAnchor).isActive = true
        
        //quitButton
        quitButton.load(title: "button_quit".localized)
        quitButton.tag = 3
        quitButton.addTarget(self, action: #selector(buttonPushed(_:)), for: .touchUpInside)
        quitButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(quitButton)
        
        quitButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        quitButton.topAnchor.constraint(equalTo: howToPlayButton.bottomAnchor, constant: spacing).isActive = true
        quitButton.widthAnchor.constraint(equalTo: resumeButton.widthAnchor).isActive = true
        quitButton.heightAnchor.constraint(equalTo: resumeButton.heightAnchor).isActive = true
        
        self.bottomAnchor.constraint(equalTo: quitButton.bottomAnchor, constant: 2 * spacing).isActive = true
    }
    
    /*=========================================================
 
                        Button Functions
 
    =========================================================*/
    
    @objc func buttonPushed(_ sender: UIButton) {
        
        if delegate == nil { return }
        
        switch sender.tag {
        
        case 0:
            delegate!.resumeButtonPushed()
            break
        case 1:
            delegate!.newGameButtonPushed()
            break
        case 2:
            delegate!.howToPlayButtonPushed()
            break
        case 3:
            delegate!.quitButtonPushed()
            break
        default:
            print("Pause menu button not recognized")
        }
    }
}




/**
===================================== WINLOSE MENU VIEW =====================================
 */

class WinLoseMenuView: UIView {
    
    /*=========================================================
 
                            Properties
 
    =========================================================*/
    
    let titleLabel = UILabel()
    let timeLabel = UILabel()
    let bestTimeLabel = UILabel()
    let newGameButton = ElevensButton()
    let quitButton = ElevensButton()
    
    let spacing: CGFloat = 10
    var delegate: MenuViewDelegate?
    
    
    /*=========================================================
 
                        Loading Functions
 
    =========================================================*/
    
    func load() {
        
        //view
        backgroundColor = .white
        layer.borderWidth = 10
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 15
        
        //titleLabel
        titleLabel.text = "WIN OR LOSE"
        titleLabel.font = ElevensStyle.subtitleFont
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 2 * spacing).isActive = true
        
        //timeLabel
        timeLabel.text = "Your time:"
        timeLabel.font = ElevensStyle.standardFont
        timeLabel.textColor = .black
        timeLabel.numberOfLines = 0
        timeLabel.lineBreakMode = .byWordWrapping
        timeLabel.textAlignment = .center
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(timeLabel)
        
        timeLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        timeLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        timeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        timeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: spacing).isActive = true
        
        //bestTimeLabel
        bestTimeLabel.text = "Best time:"
        bestTimeLabel.font = ElevensStyle.standardFont
        bestTimeLabel.textColor = .black
        bestTimeLabel.numberOfLines = 0
        bestTimeLabel.lineBreakMode = .byWordWrapping
        bestTimeLabel.textAlignment = .center
        bestTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bestTimeLabel)
        
        
        bestTimeLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        bestTimeLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        bestTimeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bestTimeLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: spacing).isActive = true
        
        //newGameButton
        newGameButton.load(title: "button_new_game".localized)
        newGameButton.tag = 0
        newGameButton.addTarget(self, action: #selector(buttonPushed(_:)), for: .touchUpInside)
        newGameButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(newGameButton)
        
        newGameButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        newGameButton.topAnchor.constraint(equalTo: bestTimeLabel.bottomAnchor, constant: spacing).isActive = true
        newGameButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: newGameButton.mediumWidthMult).isActive = true
        newGameButton.heightAnchor.constraint(equalTo: newGameButton.widthAnchor, multiplier: newGameButton.heightMult).isActive = true
        
        //quitButton
        quitButton.load(title: "button_quit".localized)
        quitButton.tag = 1
        quitButton.addTarget(self, action: #selector(buttonPushed(_:)), for: .touchUpInside)
        quitButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(quitButton)
        
        quitButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        quitButton.topAnchor.constraint(equalTo: newGameButton.bottomAnchor, constant: spacing).isActive = true
        quitButton.widthAnchor.constraint(equalTo: newGameButton.widthAnchor).isActive = true
        quitButton.heightAnchor.constraint(equalTo: newGameButton.heightAnchor).isActive = true

        self.bottomAnchor.constraint(equalTo: quitButton.bottomAnchor, constant: 2 * spacing).isActive = true
    }
    
    func displayWinLabels(time: String, best: String) {
        
        titleLabel.text = "menu_you_win".localized
        timeLabel.text = "\("menu_your_time".localized): \(time)"
        bestTimeLabel.text = "\("menu_best_time".localized): \(best)"
    }
    
    func displayLoseLabels() {
        
        titleLabel.text = "menu_you_lose".localized
        timeLabel.text = "menu_lose_msg".localized
        bestTimeLabel.text = ""
    }
    
    func displayTimeLabels(score: Int, best: Int) {
        
        titleLabel.text = "menu_times_up".localized
        timeLabel.text = "\("menu_your_score".localized): \(score)"
        bestTimeLabel.text = "\("menu_best_score".localized): \(best)"
    }
    
    /*=========================================================
 
                        Button Functions
 
    =========================================================*/
    
    @objc func buttonPushed(_ sender: UIButton) {
        
        if delegate == nil { return }
        
        switch sender.tag {
        case 0:
            delegate!.newGameButtonPushed()
            break
        case 1:
            delegate!.quitButtonPushed()
            break
        default:
            print("WinLose Menu Button not recognized")
        }
    }
}



/**
===================================== MENU VIEW DELEGATE =====================================
 */

protocol MenuViewDelegate {
    
    func resumeButtonPushed()
    func newGameButtonPushed()
    func howToPlayButtonPushed()
    func quitButtonPushed()
}
