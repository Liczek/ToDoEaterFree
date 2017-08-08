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
    var rightBorderLine = UIImageView()
    var leftSplitLine = UIImageView()
    var rightSplitLine = UIImageView()
    
    var universalConstraints = [NSLayoutConstraint]()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "mainCell")        
        separatorInset = UIEdgeInsetsMake(0, 3, 0, 3)
        
        addSubview(backgroundImage)
        addSubview(categoryNameLabel)
        addSubview(descriptionLabel)
        addSubview(catalogImage)
        addSubview(rightBorderLine)
        addSubview(leftSplitLine)
        addSubview(rightSplitLine)
        
        configureConstraints()
        
        categoryNameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        
        catalogImage.contentMode = .scaleAspectFit
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
        rightBorderLine.translatesAutoresizingMaskIntoConstraints = false
        leftSplitLine.translatesAutoresizingMaskIntoConstraints = false
        rightSplitLine.translatesAutoresizingMaskIntoConstraints = false
        
        //backgroundImage
        universalConstraints.append(backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3))
        universalConstraints.append(backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: 3))
        universalConstraints.append(backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor))
        universalConstraints.append(backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3))
        
        //categoryNameLabel
        universalConstraints.append(categoryNameLabel.leadingAnchor.constraint(equalTo: catalogImage.trailingAnchor, constant: 12))
        universalConstraints.append(categoryNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5))
        universalConstraints.append(categoryNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -5))
        universalConstraints.append(categoryNameLabel.heightAnchor.constraint(equalToConstant: 16))
        
        //descriptionLabel
        universalConstraints.append(descriptionLabel.leadingAnchor.constraint(equalTo: catalogImage.trailingAnchor, constant: 11))
        universalConstraints.append(descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5))
        universalConstraints.append(descriptionLabel.topAnchor.constraint(equalTo: categoryNameLabel.bottomAnchor, constant: 5))
        universalConstraints.append(descriptionLabel.heightAnchor.constraint(equalToConstant: 12))
        
        //catalogImage
        universalConstraints.append(catalogImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6))
        universalConstraints.append(catalogImage.topAnchor.constraint(equalTo: topAnchor, constant: 6))
        universalConstraints.append(catalogImage.heightAnchor.constraint(equalTo: heightAnchor, constant: -9))
        universalConstraints.append(catalogImage.widthAnchor.constraint(equalTo: catalogImage.heightAnchor))
        
        //rightBorderLine
        universalConstraints.append(rightBorderLine.heightAnchor.constraint(equalTo: backgroundImage.heightAnchor))
        universalConstraints.append(rightBorderLine.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor))
        universalConstraints.append(rightBorderLine.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor))
        universalConstraints.append(rightBorderLine.widthAnchor.constraint(equalToConstant: 1))
        
        //left and right split line
        universalConstraints.append(leftSplitLine.leadingAnchor.constraint(equalTo: catalogImage.trailingAnchor, constant: 5))
        universalConstraints.append(leftSplitLine.heightAnchor.constraint(equalTo: backgroundImage.heightAnchor))
        universalConstraints.append(leftSplitLine.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor))
        universalConstraints.append(leftSplitLine.widthAnchor.constraint(equalToConstant: 1))
        universalConstraints.append(rightSplitLine.leadingAnchor.constraint(equalTo: catalogImage.trailingAnchor, constant: 6))
        universalConstraints.append(rightSplitLine.heightAnchor.constraint(equalTo: backgroundImage.heightAnchor))
        universalConstraints.append(rightSplitLine.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor))
        universalConstraints.append(rightSplitLine.widthAnchor.constraint(equalToConstant: 3))
        
        NSLayoutConstraint.activate(universalConstraints)
    }

}
