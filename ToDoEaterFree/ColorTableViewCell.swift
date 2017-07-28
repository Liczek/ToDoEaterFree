//
//  ColorTableViewCell.swift
//  ToDoEaterFree
//
//  Created by Paweł Liczmański on 24.07.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

protocol ColorTableViewCellDelegate : NSObjectProtocol {
    func cellDidToggle(_ cell: ColorTableViewCell, toggle switchState: Bool)
}

class ColorTableViewCell: UITableViewCell {
    
    var nameLabel = UILabel()
    public var switchItem = UISwitch()
    var universalLayoutConstraints = [NSLayoutConstraint]()
    weak open var delegate: ColorTableViewCellDelegate?
    var color: AppColorPicker?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        separatorInset = UIEdgeInsetsMake(0, 8, 0, 8)
        selectionStyle = .none
        addSubview(nameLabel)
        addSubview(switchItem)
        
        switchItem.addTarget(self, action: #selector(switchDidChange), for: .valueChanged)
        
        configureItemsConstraints()
    }

    func switchDidChange() {
        delegate?.cellDidToggle(self, toggle: switchItem.isOn)
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
