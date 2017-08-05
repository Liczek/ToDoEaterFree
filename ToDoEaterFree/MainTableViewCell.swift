//
//  MainTableViewCell.swift
//  ToDoEaterFree
//
//  Created by Paweł Liczmański on 27.07.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    var categoryNameLabel = UILabel()
    var descriptionLabel = UILabel()
    var catalogImage = UIImageView()
    var backgroundImage = UIImageView()
    
    var universalConstraints = [NSLayoutConstraint]()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "mainCell")        
        separatorInset = UIEdgeInsetsMake(0, 3, 0, 0)
        
        addSubview(backgroundImage)
        addSubview(categoryNameLabel)
        addSubview(descriptionLabel)
        addSubview(catalogImage)
        
        configureConstraints()
        
        categoryNameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
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
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        categoryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        catalogImage.translatesAutoresizingMaskIntoConstraints =  false
        
        //backgroundImage
        universalConstraints.append(backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3))
        universalConstraints.append(backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: 3))
        universalConstraints.append(backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor))
        universalConstraints.append(backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor))
        
        //categoryNameLabel
        universalConstraints.append(categoryNameLabel.leadingAnchor.constraint(equalTo: catalogImage.trailingAnchor, constant: 5))
        universalConstraints.append(categoryNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5))
        universalConstraints.append(categoryNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5))
        universalConstraints.append(categoryNameLabel.heightAnchor.constraint(equalToConstant: 16))
        
        //descriptionLabel
        universalConstraints.append(descriptionLabel.leadingAnchor.constraint(equalTo: catalogImage.trailingAnchor, constant: 5))
        universalConstraints.append(descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5))
        universalConstraints.append(descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5))
        universalConstraints.append(descriptionLabel.heightAnchor.constraint(equalToConstant: 12))
        
        //catalogImage
        universalConstraints.append(catalogImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3))
        universalConstraints.append(catalogImage.topAnchor.constraint(equalTo: topAnchor, constant: 3))
        universalConstraints.append(catalogImage.heightAnchor.constraint(equalTo: heightAnchor, constant: -3))
        universalConstraints.append(catalogImage.widthAnchor.constraint(equalTo: catalogImage.heightAnchor))
        
        NSLayoutConstraint.activate(universalConstraints)
    }

}
