//
//  CategoryIconPickerTVCell.swift
//  ToDoEaterFree
//
//  Created by Paweł Liczmański on 07.08.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

class CategoryIconPickerTVCell: UITableViewCell {
    
    var iconImage = UIImageView()
    var iconName = UILabelWithInsets()
    var appColor = Colors()
    var universalConstraints = [NSLayoutConstraint]()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "iconCell")
        appColor.configureColors()
        
        addSubview(iconImage)
        addSubview(iconName)
        
        configureConstraints()
        NSLayoutConstraint.activate(universalConstraints)
        configureObjects()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureConstraints() {
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconName.translatesAutoresizingMaskIntoConstraints = false
        
        //iconName
        universalConstraints.append(iconName.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 8))
        //universalConstraints.append(iconName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8))
        universalConstraints.append(iconName.centerYAnchor.constraint(equalTo: centerYAnchor))
        universalConstraints.append(iconName.heightAnchor.constraint(equalTo: iconImage.heightAnchor, multiplier: 0.5))
        
        //iconImage
        universalConstraints.append(iconImage.heightAnchor.constraint(equalTo: heightAnchor, constant: -8))
        universalConstraints.append(iconImage.widthAnchor.constraint(equalTo: iconImage.heightAnchor))
        universalConstraints.append(iconImage.centerYAnchor.constraint(equalTo: centerYAnchor))
        universalConstraints.append(iconImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8))
    }
    
    func configureObjects() {
        //iconImage
        iconImage.layer.masksToBounds = true
        iconImage.layer.borderWidth = 1
        iconImage.layer.cornerRadius = 5
        iconImage.layer.borderColor = appColor.borderColor1.cgColor
        iconImage.image?.withRenderingMode(.alwaysTemplate)
        iconImage.tintColor = appColor.tintCustomColor
        iconImage.contentMode = .scaleAspectFit
        iconImage.backgroundColor = appColor.bgColor2
        
        //iconName
        iconName.layer.masksToBounds = true
        iconName.layer.borderWidth = 1
        iconName.layer.cornerRadius = 10
        iconName.layer.borderColor = appColor.borderColor1.cgColor
        iconName.font = UIFont.preferredFont(forTextStyle: .body)
        iconName.textAlignment = .natural
        iconName.textColor = appColor.universalTextColor
        iconName.backgroundColor = appColor.bgColor2
        
        
    }

}
