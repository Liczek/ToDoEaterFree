//
//  CatalogNameEditTableViewCell.swift
//  ToDoEaterFree
//
//  Created by Paweł Liczmański on 07.08.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

class CategoryNameEditTVCell: UITableViewCell {
    
    var nameTextField = UITextField()
    var acceptButton = UIButton()
    var universalConstraints = [NSLayoutConstraint]()
    
    let appColors = Colors()
    
   override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "categoryNameCell")
        appColors.configureColors()
    
    
        addSubview(nameTextField)
        addSubview(acceptButton)
        
        configureConstraints()
        NSLayoutConstraint.activate(universalConstraints)
        
        configureObjects()

    }    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureConstraints() {
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        
        //textField
        universalConstraints.append(nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8))
        universalConstraints.append(nameTextField.centerYAnchor.constraint(equalTo: centerYAnchor))
        universalConstraints.append(nameTextField.trailingAnchor.constraint(equalTo: acceptButton.leadingAnchor, constant: -8))
        
        //acceptButton
        universalConstraints.append(acceptButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8))
        universalConstraints.append(acceptButton.centerYAnchor.constraint(equalTo: centerYAnchor))
        universalConstraints.append(acceptButton.heightAnchor.constraint(equalTo: nameTextField.heightAnchor))
        universalConstraints.append(acceptButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25))
    }
    
    func configureObjects() {
        self.backgroundColor = appColors.bgColor2
        
        //textField
        nameTextField.autocorrectionType = .no
        nameTextField.placeholder = "Enter catalog name"
        nameTextField.textAlignment = .natural
        nameTextField.autocapitalizationType = .sentences
        nameTextField.borderStyle = .none
        nameTextField.backgroundColor = appColors.bgColor1
        nameTextField.layer.borderWidth = 1
        nameTextField.layer.borderColor = appColors.borderColor1.cgColor
        nameTextField.layer.masksToBounds = true
        nameTextField.layer.cornerRadius = 5
        
        //acceptButton
        acceptButton.setTitle("Accept", for: .normal)
        acceptButton.backgroundColor = appColors.bgColor3
        acceptButton.setTitleColor(appColors.universalTextColor, for: .normal)
        acceptButton.layer.borderWidth = 1
        acceptButton.layer.borderColor = appColors.borderColor1.cgColor
        acceptButton.layer.masksToBounds = true
        acceptButton.layer.cornerRadius = 5
    }

}
