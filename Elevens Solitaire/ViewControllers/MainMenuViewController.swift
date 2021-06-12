//
//  MainMenuViewController.swift
//  Elevens Solitaire
//
//  Created by Jose Monge on 2/9/21.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    /*=========================================================
 
                            Properties
 
    =========================================================*/
    
    //subviews
    
    let icon = UIImageView()
    let titleLabel = UILabel()
    let classicButton = ElevensButton()
    let arcadeButton = ElevensButton()
    let optionsButton = ElevensButton()
    
    //animation
    
    var iconInitialY: NSLayoutConstraint?
    var iconFinalY: NSLayoutConstraint?
    
    //constants
    let spacing: CGFloat = 8
    
    
    /*=========================================================
 
                    Overridden Functions
 
    =========================================================*/

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSubviews()
        doAnimation()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
    
        return .lightContent
    }
    
    /*=========================================================
 
                        Loading Functions
 
    =========================================================*/
    
    
    func loadSubviews() {
        
        //bakcgorund color
        view.backgroundColor = ElevensStyle.Color[0]
        
        //icon
        icon.image = UIImage(named: "icon")
        view.addSubview(icon)
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        iconInitialY = icon.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        iconFinalY = icon.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -0.25 * view.frame.height)
        
        iconInitialY?.isActive = true
        icon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        icon.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        icon.heightAnchor.constraint(equalTo: icon.widthAnchor).isActive = true
        
        //titleLabel
        titleLabel.text = "Elevens"
        titleLabel.font = ElevensStyle.titleFont
        titleLabel.textColor = UIColor.white
        titleLabel.alpha = 0
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: spacing).isActive = true
        
        //classicButton
        classicButton.load(title: "button_classic_mode".localized)
        classicButton.tag = 0
        classicButton.addTarget(self, action: #selector(buttonPushed(_:)), for: .touchUpInside)
        classicButton.alpha = 0
        view.addSubview(classicButton)
        classicButton.translatesAutoresizingMaskIntoConstraints = false
        
        classicButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        classicButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: spacing).isActive = true
        classicButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: classicButton.mediumWidthMult).isActive = true
        classicButton.heightAnchor.constraint(equalTo: classicButton.widthAnchor, multiplier: classicButton.heightMult).isActive = true
        
        //arcadeButton
        arcadeButton.load(title: "button_arcade_mode".localized)
        arcadeButton.tag = 1
        arcadeButton.addTarget(self, action: #selector(buttonPushed(_:)), for: .touchUpInside)
        arcadeButton.alpha = 0
        view.addSubview(arcadeButton)
        arcadeButton.translatesAutoresizingMaskIntoConstraints = false
        
        arcadeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        arcadeButton.topAnchor.constraint(equalTo: classicButton.bottomAnchor, constant: spacing).isActive = true
        arcadeButton.widthAnchor.constraint(equalTo: classicButton.widthAnchor).isActive = true
        arcadeButton.heightAnchor.constraint(equalTo: classicButton.heightAnchor).isActive = true
        
        //optionsButton
        optionsButton.load(title: "button_options".localized)
        optionsButton.tag = 2
        optionsButton.addTarget(self, action: #selector(buttonPushed(_:)), for: .touchUpInside)
        optionsButton.alpha = 0
        view.addSubview(optionsButton)
        optionsButton.translatesAutoresizingMaskIntoConstraints = false
        
        optionsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        optionsButton.topAnchor.constraint(equalTo: arcadeButton.bottomAnchor, constant: spacing).isActive = true
        optionsButton.widthAnchor.constraint(equalTo: classicButton.widthAnchor).isActive = true
        optionsButton.heightAnchor.constraint(equalTo: classicButton.heightAnchor).isActive = true
    }
    
    /*=========================================================
 
                        Button Functions
 
    =========================================================*/
    
    @objc func buttonPushed(_ sender: ElevensButton) {
        
        var destination: UIViewController?
        
        switch sender.tag {
        
        case 0: //classic game
            destination = ClassicGameViewController()
            break
        case 1:
            destination = ArcadeGameViewController()
            break
        case 2:
            destination = OptionsViewController()
        default:
            destination = ClassicGameViewController()
        }
        
        navigationController?.pushViewController(destination!, animated: true)
    }
    
    /*=========================================================
 
                            Animation
 
    =========================================================*/
    
    func doAnimation() {
        
        iconInitialY?.isActive = false
        iconFinalY?.isActive = true
        
        UIView.animate(withDuration: 1, animations: {
            
            self.view.layoutIfNeeded()
        })
        titleLabel.alpha = 1
        classicButton.alpha = 1
        arcadeButton.alpha = 1
        optionsButton.alpha = 1
    }
}
