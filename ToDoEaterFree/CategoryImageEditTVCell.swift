//
//  CatalogImageEditTableViewCell.swift
//  ToDoEaterFree
//
//  Created by Paweł Liczmański on 07.08.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

class CategoryImageEditTVCell: UITableViewCell {

    var categoryImage = UIImageView()
    var categoryName = UILabelWithInsets()
    var goButton = UIButton()
    
    var universalConstraints = [NSLayoutConstraint]()
    
    let appColors = Colors()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "categoryImageCell")
        appColors.configureColors()
        
        
        addSubview(categoryImage)
        addSubview(categoryName)
        addSubview(goButton)
        
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
        categoryName.translatesAutoresizingMaskIntoConstraints = false
        categoryImage.translatesAutoresizingMaskIntoConstraints = false
        goButton.translatesAutoresizingMaskIntoConstraints = false
        
        //categoryName
        universalConstraints.append(categoryName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8))
        universalConstraints.append(categoryName.centerYAnchor.constraint(equalTo: centerYAnchor))
        //universalConstraints.append(categoryName.trailingAnchor.constraint(equalTo: categoryImage.leadingAnchor, constant: -8))
        universalConstraints.append(categoryName.heightAnchor.constraint(equalTo: categoryImage.heightAnchor, multiplier: 1))
        
        //categoryImage
        universalConstraints.append(categoryImage.trailingAnchor.constraint(equalTo: goButton.leadingAnchor, constant: -8))
        universalConstraints.append(categoryImage.centerYAnchor.constraint(equalTo: centerYAnchor))
        universalConstraints.append(categoryImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1, constant: -8))
        universalConstraints.append(categoryImage.widthAnchor.constraint(equalTo: categoryImage.heightAnchor))
        
        //goButton
        universalConstraints.append(goButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8))
        universalConstraints.append(goButton.centerYAnchor.constraint(equalTo: centerYAnchor))
        universalConstraints.append(goButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5))
        universalConstraints.append(goButton.widthAnchor.constraint(equalTo: goButton.heightAnchor))
    }
    
    func configureObjects() {
        //cell
        self.backgroundColor = appColors.bgColor2
        
        //categoryName
        categoryName.textAlignment = .natural
        categoryName.backgroundColor = appColors.bgColor1
        categoryName.layer.borderWidth = 1
        categoryName.layer.borderColor = appColors.borderColor1.cgColor
        categoryName.layer.masksToBounds = true
        categoryName.layer.cornerRadius = 20
        categoryName.font = UIFont.preferredFont(forTextStyle: .body)
        categoryName.text = "Current icon"
        categoryName.textColor = appColors.universalTextColor
        
        //categoryImage
        categoryImage.layer.borderWidth = 1
        categoryImage.layer.borderColor = appColors.borderColor1.cgColor
        categoryImage.layer.cornerRadius = 5
        categoryImage.layer.masksToBounds = true
        categoryImage.image = UIImage(named: "camera")
        categoryImage.contentMode = .scaleAspectFit
        
        //goButton
        goButton.setTitle(">", for: .normal)
        goButton.backgroundColor = appColors.bgColor3
        goButton.setTitleColor(appColors.universalTextColor, for: .normal)
        goButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        goButton.layer.borderWidth = 1
        goButton.layer.borderColor = appColors.borderColor1.cgColor
        goButton.layer.masksToBounds = true
        goButton.layer.cornerRadius = 5
    }    
}
