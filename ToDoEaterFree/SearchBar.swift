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
    var textField = UITextFieldWithInsets()
    var searchButton = UIButton()
    
    var colorID = Int()
    var appColor = AppColors()
    
    var universalDistance: CGFloat = 5
    var searchButtonWidth: CGFloat = 40
    
    var universalConstraints = [NSLayoutConstraint]()
    var disabledConstraints = [NSLayoutConstraint]()
    var enabledConstraints = [NSLayoutConstraint]()
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        textField.delegate = self
        
        let tapBackground: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SearchBar.endEditingTextField))
        addGestureRecognizer(tapBackground)
        
        addSubview(backgroundImage)
        addSubview(textField)
        addSubview(searchButton)
        
        configurePropertiesOfViews()
        configureColors()
        
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
        disabledConstraints.append(textField.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor))
        disabledConstraints.append(textField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.40))
        disabledConstraints.append(textField.heightAnchor.constraint(equalToConstant: 18))
        
        //button
        disabledConstraints.append(searchButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.0))
    }
    
    func configureEnabledSearchBarConstraints() {
        //textField
        enabledConstraints.append(textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: universalDistance))
        enabledConstraints.append(textField.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -universalDistance))
        enabledConstraints.append(textField.heightAnchor.constraint(equalToConstant: 24))
        
        //button
        enabledConstraints.append(searchButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25))
    }
    
    
    func configurePropertiesOfViews() {
        //textField
        textField.placeholder = "Search"
        textField.textAlignment = .center
        textField.layer.masksToBounds = true
        textField.borderStyle = .none
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        
        //searchButton
        searchButton.setTitle("Search", for: .normal)
        searchButton.layer.borderWidth = 1
        searchButton.layer.cornerRadius = 5
    }
    
    
    func configureColors() {
        configureAppColor()
        
        //textField
        textField.backgroundColor = appColor.bgColor1
        textField.layer.borderColor = appColor.borderColor2.cgColor
        
        //searchButton
        searchButton.setTitleColor(appColor.textColor2, for: .normal)
        searchButton.backgroundColor = appColor.bgColor2
        searchButton.layer.borderColor = appColor.borderColor2.cgColor
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 1) { 
            NSLayoutConstraint.deactivate(self.disabledConstraints)
            NSLayoutConstraint.activate(self.enabledConstraints)
            textField.backgroundColor = UIColor.white
            textField.textAlignment = .natural
            textField.placeholder = "Enter Category or Task title"
            textField.font = UIFont.preferredFont(forTextStyle: .body)
            textField.clearButtonMode = .whileEditing
            self.layoutIfNeeded()
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 1) {
            NSLayoutConstraint.deactivate(self.enabledConstraints)
            NSLayoutConstraint.activate(self.disabledConstraints)
            textField.backgroundColor = UIColor.white.withAlphaComponent(0.8)
            textField.textAlignment = .center
            textField.placeholder = "Search"
            textField.font = UIFont.preferredFont(forTextStyle: .footnote)
            textField.resignFirstResponder()
            self.layoutIfNeeded()
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        UIView.animate(withDuration: 1) { 
            NSLayoutConstraint.deactivate(self.enabledConstraints)
            NSLayoutConstraint.activate(self.disabledConstraints)
            textField.backgroundColor = UIColor.white.withAlphaComponent(0.8)
            textField.textAlignment = .center
            textField.placeholder = "Search"
            textField.font = UIFont.preferredFont(forTextStyle: .footnote)
            textField.resignFirstResponder()
            self.layoutIfNeeded()
        }
        return true
    }
    
    
    func endEditingTextField() {
        self.endEditing(true)
    }
    
    
    func configureAppColor() {
        colorID = UserDefaults.standard.integer(forKey: "ActualColorOfApplication")
        appColor = AppColors.init(colorId: colorID)
        appColor.configureColors()
    }
    
    
    
    
    
    
    

}

