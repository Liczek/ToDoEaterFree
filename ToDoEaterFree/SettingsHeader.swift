//
//  SettingsHeader.swift
//  ToDoEaterFree
//
//  Created by Paweł Liczmański on 02.08.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import Foundation
import UIKit

class SettingsHeader: UIView {
    
    let sectionNameLabel = UILabel()
    let headerBackground = UIImageView()
    var universalConstraints = [NSLayoutConstraint]()
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        
        self.addSubview(headerBackground)
        self.addSubview(sectionNameLabel)
        configureConstraints()
        NSLayoutConstraint.activate(universalConstraints)
        
        
    }
    
    func configureConstraints() {
        sectionNameLabel.translatesAutoresizingMaskIntoConstraints = false
        headerBackground.translatesAutoresizingMaskIntoConstraints = false
        
        //HeaderLabel
        universalConstraints.append(sectionNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor))
        universalConstraints.append(sectionNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor))
        
        //HeaderBackground
        universalConstraints.append(headerBackground.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1))
        universalConstraints.append(headerBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -1))
        universalConstraints.append(headerBackground.topAnchor.constraint(equalTo: topAnchor, constant: 1))
        universalConstraints.append(headerBackground.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1))
    }
}
