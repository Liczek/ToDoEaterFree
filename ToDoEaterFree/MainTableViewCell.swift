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
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "mainCell")
        
        separatorInset = UIEdgeInsetsMake(0, 8, 0, 8)
        
        addSubview(categoryNameLabel)
        addSubview(descriptionLabel)
        
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
        
        categoryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //categoryNameLabel
        universalConstraints.append(categoryNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5))
        universalConstraints.append(categoryNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5))
        universalConstraints.append(categoryNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5))
        universalConstraints.append(categoryNameLabel.heightAnchor.constraint(equalToConstant: 16))
        
        //descriptionLabel
        universalConstraints.append(descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5))
        universalConstraints.append(descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5))
        universalConstraints.append(descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5))
        universalConstraints.append(descriptionLabel.heightAnchor.constraint(equalToConstant: 12))
        
        NSLayoutConstraint.activate(universalConstraints)
    }

}
