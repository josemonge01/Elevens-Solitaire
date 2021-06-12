//
//  HowToPlayViewController.swift
//  Elevens Solitaire
//
//  Created by Jose Monge on 5/25/21.
//

import UIKit

class HowToPlayViewController: UIViewController {
    
    /*=========================================================
 
                            Properties
 
    =========================================================*/
    
    //subviews
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let infoLabel1 = UILabel()
    let graphic1 = UIImageView()
    let infoLabel2 = UILabel()
    let graphic2 = UIImageView()
    let infoLabel3 = UILabel()
    let graphic3 = UIImageView()
    let infoLabel4 = UILabel()
    let doneButton = ElevensButton()
    
    //constants
    
    let spacing: CGFloat = 15
    
    //misc. properties
    
    var useClassicMode = true
    
    /*=========================================================
 
                        Overridden Function
 
    =========================================================*/

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSubviews()
    }

    /*=========================================================
 
                        Loading Functions
 
    =========================================================*/
    
    func loadSubviews() {
        
        //view
        view.backgroundColor = .white
        
        //scrollView
        scrollView.alwaysBounceVertical = true
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        //contentView
        contentView.backgroundColor = UIColor.white
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        //titleLabel
        titleLabel.text = "htp_title".localized
        titleLabel.font = ElevensStyle.titleFont
        titleLabel.textColor = .black
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: spacing).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: spacing).isActive = true
        
        //text
        if useClassicMode {
            
            subtitleLabel.text = "htp_classic".localized
            infoLabel1.text = "htp_cl_text1".localized
            infoLabel2.text = "htp_cl_text2".localized
            infoLabel3.text = "htp_cl_text3".localized
            infoLabel4.text = "htp_cl_text4".localized
        } else {
            
            subtitleLabel.text = "htp_arcade".localized
            infoLabel1.text = "htp_ar_text1".localized
            infoLabel2.text = "htp_ar_text2".localized
            infoLabel3.text = "htp_ar_text3".localized
            infoLabel4.text = "htp_ar_text4".localized
        }
        
        //subtitleLabel
        subtitleLabel.font = ElevensStyle.subtitleFont
        subtitleLabel.textColor = .black
        contentView.addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        subtitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: spacing).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: spacing).isActive = true
        
        //infoLabel1
        infoLabel1.font = ElevensStyle.smallFont
        infoLabel1.textColor = .black
        infoLabel1.numberOfLines = 0
        infoLabel1.lineBreakMode = .byWordWrapping
        contentView.addSubview(infoLabel1)
        infoLabel1.translatesAutoresizingMaskIntoConstraints = false
        
        infoLabel1.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: spacing).isActive = true
        infoLabel1.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -spacing).isActive = true
        infoLabel1.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: spacing).isActive = true
        
        //graphic1
        graphic1.image = UIImage(named: "sum_11")
        contentView.addSubview(graphic1)
        graphic1.translatesAutoresizingMaskIntoConstraints = false
        
        graphic1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        graphic1.topAnchor.constraint(equalTo: infoLabel1.bottomAnchor, constant: spacing).isActive = true
        graphic1.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        graphic1.heightAnchor.constraint(equalTo: graphic1.widthAnchor, multiplier: 0.4).isActive = true
        
        //infoLabel2
        infoLabel2.font = ElevensStyle.smallFont
        infoLabel2.textColor = .black
        infoLabel2.numberOfLines = 0
        infoLabel2.lineBreakMode = .byWordWrapping
        contentView.addSubview(infoLabel2)
        infoLabel2.translatesAutoresizingMaskIntoConstraints = false
        
        infoLabel2.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: spacing).isActive = true
        infoLabel2.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -spacing).isActive = true
        infoLabel2.topAnchor.constraint(equalTo: graphic1.bottomAnchor, constant: spacing).isActive = true
        
        //graphic2
        graphic2.image = UIImage(named: "ace_face")
        contentView.addSubview(graphic2)
        graphic2.translatesAutoresizingMaskIntoConstraints = false
        
        graphic2.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        graphic2.topAnchor.constraint(equalTo: infoLabel2.bottomAnchor, constant: spacing).isActive = true
        graphic2.widthAnchor.constraint(equalTo: graphic1.widthAnchor).isActive = true
        graphic2.heightAnchor.constraint(equalTo: graphic1.heightAnchor).isActive = true
        
        //infoLabel3
        infoLabel3.font = ElevensStyle.smallFont
        infoLabel3.textColor = .black
        infoLabel3.numberOfLines = 0
        infoLabel3.lineBreakMode = .byWordWrapping
        contentView.addSubview(infoLabel3)
        infoLabel3.translatesAutoresizingMaskIntoConstraints = false
        
        infoLabel3.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: spacing).isActive = true
        infoLabel3.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -spacing).isActive = true
        infoLabel3.topAnchor.constraint(equalTo: graphic2.bottomAnchor, constant: spacing).isActive = true
        
        //graphic3
        if !useClassicMode {
            
            graphic3.image = UIImage(named: "point")
            contentView.addSubview(graphic3)
            graphic3.translatesAutoresizingMaskIntoConstraints = false
            
            graphic3.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: spacing).isActive = true
            graphic3.topAnchor.constraint(equalTo: infoLabel3.bottomAnchor, constant: spacing).isActive = true
            graphic3.widthAnchor.constraint(equalTo: graphic1.widthAnchor).isActive = true
            graphic3.heightAnchor.constraint(equalTo: graphic1.heightAnchor).isActive = true
        }
        
        //infoLabel4
        infoLabel4.font = ElevensStyle.smallFont
        infoLabel4.textColor = .black
        infoLabel4.numberOfLines = 0
        infoLabel4.lineBreakMode = .byWordWrapping
        contentView.addSubview(infoLabel4)
        infoLabel4.translatesAutoresizingMaskIntoConstraints = false
        
        infoLabel4.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: spacing).isActive = true
        infoLabel4.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -spacing).isActive = true
        if useClassicMode {
            infoLabel4.topAnchor.constraint(equalTo: infoLabel3.bottomAnchor, constant: spacing).isActive = true
        } else {
            infoLabel4.topAnchor.constraint(equalTo: graphic3.bottomAnchor, constant: spacing).isActive = true
        }
        
        //doneButton
        doneButton.load(title: "button_done".localized)
        doneButton.addTarget(self, action: #selector(doneButtonPushed), for: .touchUpInside)
        contentView.addSubview(doneButton)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        
        doneButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        doneButton.topAnchor.constraint(equalTo: infoLabel4.bottomAnchor, constant: spacing).isActive = true
        doneButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: doneButton.mediumWidthMult).isActive = true
        doneButton.heightAnchor.constraint(equalTo: doneButton.widthAnchor, multiplier: doneButton.heightMult).isActive = true
        
        contentView.bottomAnchor.constraint(equalTo: doneButton.bottomAnchor, constant: spacing).isActive = true
    }
    
    /*=========================================================
 
                        Button Function
 
    =========================================================*/
    
    @objc func doneButtonPushed() {
        
        navigationController?.popViewController(animated: true)
    }
}
