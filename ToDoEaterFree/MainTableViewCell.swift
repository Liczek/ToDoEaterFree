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
    
    var universalConstraints = [NSLayoutConstraint]()


    override func awakeFromNib() {
        super.awakeFromNib()
        
        separatorInset = UIEdgeInsetsMake(0, 8, 0, 8)
        
        addSubview(categoryNameLabel)
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate(universalConstraints)
        
        categoryNameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureConstraints() {
        
        //categoryNameLabel
        universalConstraints.append(categoryNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5))
        universalConstraints.append(categoryNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5))
        universalConstraints.append(categoryNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5))
        
        //descriptionLabel
        universalConstraints.append(categoryNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5))
        universalConstraints.append(categoryNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5))
        universalConstraints.append(categoryNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5))
        
    }

}
