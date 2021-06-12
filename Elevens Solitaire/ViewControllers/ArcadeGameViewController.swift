//
//  ArcadeGameViewController.swift
//  Elevens Solitaire
//
//  Created by Jose Monge on 5/19/21.
//

import UIKit

class ArcadeGameViewController: UIViewController, LayoutViewDelegate, MenuViewDelegate {
    
    /*=========================================================
 
                            Properties
 
    =========================================================*/
    
    //game components
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var appData: Data?
    let game = ArcadeGame()
    var selection: (Int?, Int?)
    var timer: Timer?
    var timeCount = 600
    let maxTime = 600
    var score = 0
    var bestScore = 0
    let sounds = AudioPlayer()
    
    //animation
    
    var pauseMenuShownConstraint: NSLayoutConstraint?
    var pauseMenuHiddenConstraint: NSLayoutConstraint?
    var winLoseShownConstraint: NSLayoutConstraint?
    var winLoseHiddenConstraint: NSLayoutConstraint?
    let animationDuration = 0.25
    
    //subviews
    
    let statusView = StatusView()
    let pauseButton = ElevensButton()
    let layout = LayoutView()
    let pauseMenu = PauseMenuView()
    let winLoseMenu = WinLoseMenuView()
    let blur = UIVisualEffectView()
    
    /*=========================================================
 
                    Overridden Functions
 
    =========================================================*/
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        loadSubviews()
        sounds.playStartSound()
        runTimer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        pauseButtonPushed()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    /*=========================================================
 
                        Loading Functions
 
    =========================================================*/

    func loadData() {
        
        var temp = [Data]()
        
        do {
            temp = try context.fetch(Data.fetchRequest())
        } catch {
            print("Error - ArcadeGameViewController - Couldn't get data")
        }
        
        if temp.count == 0 {
            appData = Data(context: context)
            appData?.deck = 0
            appData?.background = 0
            appData?.bestTime = 0
            appData?.bestScore = 0
        } else{
            appData = temp[0]
        }
        
        bestScore = Int(appData?.bestScore ?? 0)
    }
    
    func loadSubviews() {
        
        view.backgroundColor = ElevensStyle.Color[Int(appData?.background ?? 0)]
        
        //statusView
        statusView.load()
        statusView.setDeckImage(to: UIImage(named: ElevensStyle.Deck[Int(appData?.deck ?? 0)] ?? "deck_0"))
        statusView.updateLabelText(label: 0, text: "\("status_time".localized): 00:00.0")
        statusView.updateLabelFont(label: 0, font: ElevensStyle.standardFont)
        statusView.updateLabelText(label: 1, text: "\("status_score".localized): 0")
        statusView.updateLabelFont(label: 1, font: ElevensStyle.standardFont)
        statusView.updateLabelText(label: 2, text: "\("status_best_score".localized): \(bestScore)")
        statusView.updateLabelFont(label: 2, font: ElevensStyle.standardFont)
        view.addSubview(statusView)
        statusView.translatesAutoresizingMaskIntoConstraints = false
        
        statusView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        statusView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        statusView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        statusView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        
        //pauseButton
        pauseButton.load(title: "button_pause".localized)
        pauseButton.addTarget(self, action: #selector(pauseButtonPushed), for: .touchUpInside)
        view.addSubview(pauseButton)
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        
        pauseButton.topAnchor.constraint(equalTo: statusView.bottomAnchor).isActive = true
        pauseButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        pauseButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        pauseButton.heightAnchor.constraint(equalTo: pauseButton.widthAnchor, multiplier: 0.35).isActive = true
        
        //layout
        layout.delegate = self
        layout.load()
        view.addSubview(layout)
        layout.translatesAutoresizingMaskIntoConstraints = false
        
        layout.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        layout.topAnchor.constraint(equalTo: pauseButton.bottomAnchor).isActive = true
        layout.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        layout.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        //blur
        let blurEffect = UIBlurEffect(style: .dark)
        blur.effect = blurEffect
        blur.alpha = 0
        view.addSubview(blur)
        blur.translatesAutoresizingMaskIntoConstraints = false
        
        blur.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        blur.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        blur.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        blur.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        //pauseMenu
        pauseMenu.delegate = self
        pauseMenu.load()
        view.addSubview(pauseMenu)
        pauseMenu.translatesAutoresizingMaskIntoConstraints = false
        
        pauseMenu.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pauseMenuHiddenConstraint = pauseMenu.topAnchor.constraint(equalTo: view.bottomAnchor)
        pauseMenuShownConstraint = pauseMenu.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        pauseMenuHiddenConstraint?.isActive = true
        pauseMenu.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        //winLoseMenu
        winLoseMenu.delegate = self
        winLoseMenu.load()
        view.addSubview(winLoseMenu)
        winLoseMenu.translatesAutoresizingMaskIntoConstraints = false
        
        winLoseMenu.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        winLoseHiddenConstraint = winLoseMenu.topAnchor.constraint(equalTo: view.bottomAnchor)
        winLoseShownConstraint = winLoseMenu.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        winLoseHiddenConstraint?.isActive = true
        winLoseMenu.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
    }
    
    /*=========================================================
 
                        Button Functions
 
    =========================================================*/
    
    @objc func pauseButtonPushed() {
        
        pauseTimer()
        showPauseMenu()
    }
    
    func resumeButtonPushed() {
        
        hidePauseMenu()
        runTimer()
    }
    
    func newGameButtonPushed() {
        
        game.newGame()
        selection = (nil, nil)
        layout.updateLayout()
        hidePauseMenu()
        hideWinLoseMenu()
        score = 0
        resetTimer()
        statusView.updateLabelText(label: 2, text: "\("status_best_score".localized): \(bestScore)")
        sounds.playStartSound()
    }
    
    func howToPlayButtonPushed() {
        
        let destination = HowToPlayViewController()
        destination.useClassicMode = false
        navigationController?.pushViewController(destination, animated: true)
    }
    
    func quitButtonPushed() {
        
        navigationController?.popViewController(animated: true)
    }
    
    /*=========================================================
 
                            Animations
 
    =========================================================*/
    
    func showPauseMenu() {
        
        pauseMenuHiddenConstraint?.isActive = false
        pauseMenuShownConstraint?.isActive = true
        
        UIView.animate(withDuration: animationDuration, animations: {
            self.view.layoutIfNeeded()
            self.blur.alpha = 1
        })
    }
    
    func hidePauseMenu() {
        
        pauseMenuShownConstraint?.isActive = false
        pauseMenuHiddenConstraint?.isActive = true
        
        UIView.animate(withDuration: animationDuration, animations: {
            self.view.layoutIfNeeded()
            self.blur.alpha = 0
        })
    }
    
    func showWinLoseMenu() {
        
        winLoseHiddenConstraint?.isActive = false
        winLoseShownConstraint?.isActive = true
        
        UIView.animate(withDuration: animationDuration, animations: {
            self.view.layoutIfNeeded()
            self.blur.alpha = 1
        })
    }
    
    func hideWinLoseMenu() {
        
        winLoseShownConstraint?.isActive = false
        winLoseHiddenConstraint?.isActive = true
        
        UIView.animate(withDuration: animationDuration, animations: {
            self.view.layoutIfNeeded()
            self.blur.alpha = 0
        })
    }
    
    /*=========================================================
 
                        Sounds and Signals
 
    =========================================================*/
    
    func signalTimesUp(withBestScoreSound: Bool) {
        
        winLoseMenu.displayTimeLabels(score: score, best: bestScore)
        showWinLoseMenu()
        if withBestScoreSound {
            sounds.playSpecialWinSound()
        } else {
            sounds.playWinSound()
        }
    }
    
    func signalSuccess() {
        
        sounds.playSuccessSound()
    }
    
    func signalFail() {
        
        sounds.playFailSound()
    }
    
    /*=========================================================
 
                    LayoutView Delegate Stubs
 
    =========================================================*/
    
    func getCardImage(at index: Int) -> UIImage? {
        
        let card = game.layout[index]
        
        if card != nil {
            return UIImage(named: "\(card!.rank)\(card!.suit)")
        }
        
        return UIImage(named: "nocard")
    }
    
    func cardSelected(at index: Int) {
        
        //undo selection
        if index == selection.0 {
            
            layout.unhighlightCard(at: index)
            selection.0 = nil
            return
        }
        
        //first selection
        if selection.0 == nil {
            
            selection.0 = index
            layout.highlightCard(at: index)
            return
        }
        
        //second selection
        
        selection.1 = index
        
        if game.moveIsLegal(selection) {
            
            //move is legal
            score += 1
            statusView.updateLabelText(label: 1, text: "\("status_score".localized): \(score)")
            game.removeCards(at: selection)
            game.replaceCards()
            layout.unhighlightCard(at: selection.0!)
            layout.unhighlightCard(at: selection.1!)
            layout.updateLayout(at: selection)
            selection = (nil, nil)
            signalSuccess()
        }
        else {
            
            //move is illegal
            score = (score > 0 ? score - 1 : 0)
            statusView.updateLabelText(label: 1, text: "\("status_score".localized): \(score)")
            signalFail()
            layout.unhighlightCard(at: selection.0!)
            layout.unhighlightCard(at: selection.1!)
            selection = (nil, nil)
        }
    }
    
    /*=========================================================
 
                        Timer Functions
 
    ==========================================================*/
    
    func runTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimeCount), userInfo: nil, repeats: true)
    }
    
    func pauseTimer() {
        
        timer?.invalidate()
        timer = nil
    }
    
    func resetTimer() {
        
        timeCount = maxTime
        runTimer()
    }
    
    @objc func updateTimeCount() {
        
        timeCount -= 1
        let str = timestring(timeCount)
        statusView.updateLabelText(label: 0, text: "\("status_time".localized): \(str)")
        if timeCount <= 0 {
            endGame()
        }
    }
    
    func endGame() {
        
        pauseTimer()
        if score > bestScore || bestScore == 0 {
            bestScore = score
            appData?.bestScore = Int32(bestScore)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            signalTimesUp(withBestScoreSound: true)
        } else {
            signalTimesUp(withBestScoreSound: false)
        }
    }
    
    /*=========================================================
 
                        Helper Functions
 
    =========================================================*/
    
    func timestring(_ time: Int) -> String {
        
        let minutes = time / 600
        let seconds = (time % 600) / 10
        let tenths = time % 10
        
        let minStr = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        let secStr = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        
        return "\(minStr):\(secStr).\(tenths)"
    }

}
