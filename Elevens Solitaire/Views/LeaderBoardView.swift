//
//  File.swift
//  Elevens Solitaire
//
//  Created by Jose Monge on 2/9/21.
//

import Foundation
import UIKit

class LeaderBoardView: UIView {
    
    //properties
    
    var nameLabels = [UILabel]()
    var valueLabels = [UILabel]()
    let spacing: CGFloat = 4
    var tempBottomAnchor: NSLayoutConstraint?
    
    //methods
    
    func load(names: [String], values: [String], count: Int) {
        
        if count != names.count || count != values.count {
            print("Error - LeaderBoardView - Invalid Arguments")
            return
        }
        
        self.backgroundColor = .white
        var nextBottom = self.topAnchor
        
        for i in 0..<count {
            
            let nameLabel = UILabel()
            nameLabel.text = names[i]
            nameLabel.font = ElevensStyle.smallFont
            nameLabels.append(nameLabel)
            addSubview(nameLabel)
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            
            nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: spacing).isActive = true
            nameLabel.topAnchor.constraint(equalTo: nextBottom, constant: spacing).isActive = true
            nameLabel.rightAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            
            let valueLabel = UILabel()
            valueLabel.text = values[i]
            valueLabel.font = ElevensStyle.smallFont
            valueLabel.textAlignment = .right
            valueLabels.append(valueLabel)
            addSubview(valueLabel)
            valueLabel.translatesAutoresizingMaskIntoConstraints = false
            
            valueLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: spacing).isActive = true
            valueLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
            
            nextBottom = nameLabel.bottomAnchor
        }
        
        tempBottomAnchor = self.bottomAnchor.constraint(equalTo: nextBottom, constant: spacing)
        tempBottomAnchor?.isActive = true
    }
    
    func reload(names: [String], values: [String], count: Int) {
        
        if count != names.count || count != values.count {
            print("Error - LeaderBoardView - Invalid Arguments")
            return
        }
        
        var i = 0
        while i < count && i < nameLabels.count {
            
            nameLabels[i].text = names[i]
            valueLabels[i].text = values[i]
            i += 1
        }
        
        var nextBottom = nameLabels.last?.bottomAnchor ?? self.topAnchor
        
        while i < count {
            
            let nameLabel = UILabel()
            nameLabel.text = names[i]
            nameLabel.font = ElevensStyle.smallFont
            nameLabels.append(nameLabel)
            addSubview(nameLabel)
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            
            nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: spacing).isActive = true
            nameLabel.topAnchor.constraint(equalTo: nextBottom, constant: spacing).isActive = true
            nameLabel.rightAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            
            let valueLabel = UILabel()
            valueLabel.text = values[i]
            valueLabel.font = ElevensStyle.smallFont
            valueLabel.textAlignment = .right
            valueLabels.append(valueLabel)
            addSubview(valueLabel)
            valueLabel.translatesAutoresizingMaskIntoConstraints = false
            
            valueLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: spacing).isActive = true
            valueLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
            
            nextBottom = nameLabel.bottomAnchor
            i += 1
        }
        
        tempBottomAnchor?.isActive = false
        
        while i < nameLabels.count {
            
            nameLabels.remove(at: i)
            valueLabels.remove(at: i)
        }
        
        tempBottomAnchor = self.bottomAnchor.constraint(equalTo: nameLabels.last?.bottomAnchor ?? topAnchor, constant: spacing)
        tempBottomAnchor?.isActive = true
    }
}
