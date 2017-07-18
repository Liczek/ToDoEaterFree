//
//  CategoryTableViewCell.swift
//  ToDoEaterFree
//
//  Created by Paweł Liczmański on 15.07.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryLogoImagView: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var categoryProgresLabel: UILabel!
    @IBOutlet weak var indicatorButton: UIButton!
    @IBOutlet weak var borderBeforIndicatorButton: UIImageView!
    
    
    @IBAction func indicatorButtonTapped(_ sender: UIButton) {
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        separatorInset.left = 8
        separatorInset.right = 8
        
        categoryNameLabel.textColor = UIColor.red.withAlphaComponent(0.7)
        categoryProgresLabel.textColor = UIColor.red.withAlphaComponent(0.5)
        borderBeforIndicatorButton.backgroundColor = UIColor.red.withAlphaComponent(0.2)
        indicatorButton.tintColor = UIColor.red.withAlphaComponent(0.2)
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
