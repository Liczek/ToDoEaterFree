//
//  ColorTableViewCell.swift
//  ToDoEaterFree
//
//  Created by Paweł Liczmański on 24.07.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

class ColorTableViewCell: UITableViewCell {
    
    var nameLabel = UILabel()
    var switchItem = UISwitch()
    var universalLayoutConstraints = [NSLayoutConstraint]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        separatorInset = UIEdgeInsetsMake(0, 8, 0, 8)
        
        addSubview(nameLabel)
        addSubview(switchItem)
        
        configureItemsConstraints()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureItemsConstraints() {
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        switchItem.translatesAutoresizingMaskIntoConstraints = false
        
        //nameLabel
        universalLayoutConstraints.append(nameLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 8))
        universalLayoutConstraints.append(nameLabel.trailingAnchor.constraint(equalTo: switchItem.leadingAnchor, constant: -8))
        universalLayoutConstraints.append(nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor))
        
        //switchItem
        universalLayoutConstraints.append(switchItem.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor))
        universalLayoutConstraints.append(switchItem.centerYAnchor.constraint(equalTo: centerYAnchor))
        
        NSLayoutConstraint.activate(universalLayoutConstraints)
    }

}
