//
//  SearchBar.swift
//  ToDoEaterFree
//
//  Created by Paweł Liczmański on 17.07.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

class SearchBar: UIView, UITextFieldDelegate {

    var backgroundImage = UIImageView()
    var textField = UITextField()
    var searchButton = UIButton()
    
    
    var universalDistance: CGFloat = 5
    var searchButtonWidth: CGFloat = 40
    
    var universalConstraints = [NSLayoutConstraint]()
    var disabledConstraints = [NSLayoutConstraint]()
    var enabledConstraints = [NSLayoutConstraint]()
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        textField.delegate = self
        
        addSubview(backgroundImage)
        addSubview(textField)
        addSubview(searchButton)
        configurePropertiesOfViews()
        configureUniversalSearchBarConstraints()
        configureDisabledSearchBarConstraints()
        configureEnabledSearchBarConstraints()
        
        NSLayoutConstraint.activate(universalConstraints)
        NSLayoutConstraint.activate(disabledConstraints)

    }
    
    func configureUniversalSearchBarConstraints() {
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        
        //background
        universalConstraints.append(backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor))
        universalConstraints.append(backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor))
        universalConstraints.append(backgroundImage.heightAnchor.constraint(equalTo: heightAnchor))
        universalConstraints.append(backgroundImage.widthAnchor.constraint(equalTo: widthAnchor))
        
        //textField
        universalConstraints.append(textField.centerYAnchor.constraint(equalTo: centerYAnchor))
        
        //button
        universalConstraints.append(searchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -universalDistance))
        universalConstraints.append(searchButton.topAnchor.constraint(equalTo: textField.topAnchor))
        universalConstraints.append(searchButton.bottomAnchor.constraint(equalTo: textField.bottomAnchor))
        
    }
    
    func configureDisabledSearchBarConstraints() {
        
        //textField
        disabledConstraints.append(textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: universalDistance))
        disabledConstraints.append(textField.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor))
        
        //button
        disabledConstraints.append(searchButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.0))
    }
    
    func configureEnabledSearchBarConstraints() {
        
        //textField
        enabledConstraints.append(textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: universalDistance))
        enabledConstraints.append(textField.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -universalDistance))
        
        //button
        enabledConstraints.append(searchButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25))
    }
    
    func configurePropertiesOfViews() {
        
        //background
        backgroundImage.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        //textField
        textField.placeholder = "Search"
        textField.backgroundColor = UIColor.white
        
        //searchButton
        searchButton.setTitle("Tap", for: .normal)
        searchButton.setTitleColor(UIColor.red.withAlphaComponent(0.5), for: .normal)
        searchButton.backgroundColor = UIColor.darkGray
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 1) { 
            NSLayoutConstraint.deactivate(self.disabledConstraints)
            NSLayoutConstraint.activate(self.enabledConstraints)
            self.layoutIfNeeded()
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        UIView.animate(withDuration: 1) { 
            NSLayoutConstraint.deactivate(self.enabledConstraints)
            NSLayoutConstraint.activate(self.disabledConstraints)
            textField.resignFirstResponder()
            self.layoutIfNeeded()
        }
        
        return true
    }

}
