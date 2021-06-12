//
//  OptionsViewController.swift
//  Elevens Solitaire
//
//  Created by Jose Monge on 5/21/21.
//

import UIKit

class OptionsViewController: UIViewController {
    
    /*=========================================================
 
                            Properties
 
    =========================================================*/
    
    //other
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var appData: Data?
    var selectedDeckImage: UIButton?
    var selectedColor: UIButton?
    
    //subviews
    
    let titleLabel = UILabel()
    let deckLabel = UILabel()
    let deckStackView = UIStackView()
    let colorLabel = UILabel()
    let colorStackView = UIStackView()
    let resetButton = UIButton()
    let doneButton = ElevensButton()
    
    //constants
    
    let spacing: CGFloat = 15

    
    /*=========================================================
 
                    Overridden Functions
 
    =========================================================*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        loadSubviews()
    }
    
    
    /*=========================================================
 
                    Loading Functions
 
    =========================================================*/
    
    func loadData() {
        
        var temp = [Data]()
        
        do {
            temp = try context.fetch(Data.fetchRequest())
        } catch {
            print("Error getting data in Options ViewControler")
            navigationController?.popViewController(animated: true)
        }
        
        if temp.count == 0 {
            
            appData = Data(context: context)
            appData?.background = 0
            appData?.deck = 0
            appData?.bestTime = 0
            appData?.bestScore = 0
        } else {
            appData = temp[0]
        }
    }
    
    func loadSubviews() {
        
        //view
        view.backgroundColor = ElevensStyle.Color[0]
        
        //titleLabel
        titleLabel.text = "options_title".localized
        titleLabel.font = ElevensStyle.titleFont
        titleLabel.textColor = UIColor.white
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: spacing).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        //deckLabel
        deckLabel.text = "options_deck".localized
        deckLabel.font = ElevensStyle.subtitleFont
        deckLabel.textColor = UIColor.white
        view.addSubview(deckLabel)
        deckLabel.translatesAutoresizingMaskIntoConstraints = false
        
        deckLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        deckLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: spacing).isActive = true
        
        //deckStackView
        deckStackView.alignment = .fill
        deckStackView.distribution = .fillEqually
        deckStackView.axis = .horizontal
        
        for i in 0..<ElevensStyle.Deck.count {
            
            let deckImage = UIButton()
            deckImage.setImage(UIImage(named: ElevensStyle.Deck[i] ?? "deck_0"), for: .normal)
            deckImage.tag = i
            deckImage.layer.borderWidth = 3
            
            if appData!.deck == i {
                deckImage.layer.borderColor = UIColor.blue.cgColor
                selectedDeckImage = deckImage
            }
            else {
                deckImage.layer.borderColor = UIColor.white.cgColor
            }
            
            deckImage.addTarget(self, action: #selector(deckSelected(_:)), for: .touchUpInside)
            deckStackView.addArrangedSubview(deckImage)
        }
        
        view.addSubview(deckStackView)
        deckStackView.translatesAutoresizingMaskIntoConstraints = false
        
        deckStackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        deckStackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        deckStackView.topAnchor.constraint(equalTo: deckLabel.bottomAnchor, constant: spacing).isActive = true
        deckStackView.heightAnchor.constraint(equalTo: deckStackView.widthAnchor, multiplier: 0.2).isActive = true
        
        //colorLabel
        colorLabel.text = "options_background_color".localized
        colorLabel.font = ElevensStyle.subtitleFont
        colorLabel.textColor = UIColor.white
        view.addSubview(colorLabel)
        colorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        colorLabel.leftAnchor.constraint(equalTo: deckLabel.leftAnchor).isActive = true
        colorLabel.topAnchor.constraint(equalTo: deckStackView.bottomAnchor, constant: spacing).isActive = true
        
        //colorStackView
        colorStackView.alignment = .fill
        colorStackView.distribution = .fillEqually
        colorStackView.axis = .horizontal
        
        for i in 0..<ElevensStyle.Color.count {
            
            let colorButton = UIButton()
            colorButton.backgroundColor = ElevensStyle.Color[i]
            colorButton.tag = i
            colorButton.setTitle("", for: .normal)
            colorButton.layer.borderWidth = 3
            
            if appData!.background == i {
                colorButton.layer.borderColor = UIColor.blue.cgColor
                selectedColor = colorButton
            }
            else {
                colorButton.layer.borderColor = UIColor.white.cgColor
            }
            
            colorButton.addTarget(self, action: #selector(colorSelected(_:)), for: .touchUpInside)
            colorStackView.addArrangedSubview(colorButton)
        }
        
        view.addSubview(colorStackView)
        colorStackView.translatesAutoresizingMaskIntoConstraints = false
        
        colorStackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        colorStackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        colorStackView.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: spacing).isActive = true
        colorStackView.heightAnchor.constraint(equalTo: colorStackView.widthAnchor, multiplier: 0.2).isActive = true
        
        //resetButton
        resetButton.setTitle("options_reset_scores".localized, for: .normal)
        resetButton.setTitleColor(.red, for: .normal)
        resetButton.backgroundColor = UIColor.white
        resetButton.addTarget(self, action: #selector(resetButtonPushed(_:)), for: .touchUpInside)
        view.addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        resetButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        resetButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        resetButton.topAnchor.constraint(equalTo: colorStackView.bottomAnchor, constant: spacing).isActive = true
        
        //doneButton
        doneButton.load(title: "button_done".localized)
        doneButton.addTarget(self, action: #selector(doneButtonPushed), for: .touchUpInside)
        view.addSubview(doneButton)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        
        doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        doneButton.topAnchor.constraint(equalTo: resetButton.bottomAnchor, constant: spacing).isActive = true
        doneButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: doneButton.mediumWidthMult).isActive = true
        doneButton.heightAnchor.constraint(equalTo: doneButton.widthAnchor, multiplier: doneButton.heightMult).isActive = true
        
    }
    
    /*=========================================================
 
                        Button Functions
 
    =========================================================*/
    
    @objc func deckSelected(_ sender: UIButton) {
        
        appData?.deck = Int32(sender.tag)
        
        selectedDeckImage?.layer.borderColor = UIColor.white.cgColor
        selectedDeckImage = sender
        selectedDeckImage?.layer.borderColor = UIColor.blue.cgColor
    }
    
    @objc func colorSelected(_ sender: UIButton) {
        
        appData?.background = Int32(sender.tag)
        
        selectedColor?.layer.borderColor = UIColor.white.cgColor
        selectedColor = sender
        selectedColor?.layer.borderColor = UIColor.blue.cgColor
    }
    
    @objc func resetButtonPushed(_ sender: UIButton) {
        
        appData?.bestTime = 0
        appData?.bestScore = 0
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    @objc func doneButtonPushed() {
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
    }
}
