//
//  AppColors.swift
//  ToDoEaterFree
//
//  Created by Paweł Liczmański on 25.07.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import Foundation
import UIKit

class AppColors {
    
    var colorID = 1

    var textColor1 = UIColor()
    var textColor2 = UIColor()
    var textColor3 = UIColor()
    var bgColor1 = UIColor()
    var bgColor2 = UIColor()
    var bgColor3 = UIColor()
    var borderColor1 = UIColor()
    var borderColor2 = UIColor()
    var placeholderColor1 = UIColor()
    var placeholderColor2 = UIColor()
    var tintCustomColor = UIColor()
    
    
    func configureColors() {
        if colorID == 0 {
            self.textColor1 = UIColor.green
            self.textColor2 = UIColor.green
            self.textColor3 = UIColor.green
            self.bgColor1 = UIColor.green
            self.bgColor2 = UIColor.green
            self.bgColor3 = UIColor.green
            self.borderColor1 = UIColor.green
            self.borderColor2 = UIColor.green
            self.placeholderColor1 = UIColor.green
            self.placeholderColor2 = UIColor.green
            self.tintCustomColor = UIColor.green
            
        } else if colorID == 1 {
            self.textColor1 = UIColor.red
            self.textColor2 = UIColor.red
            self.textColor3 = UIColor.red
            self.bgColor1 = UIColor.red
            self.bgColor2 = UIColor.red
            self.bgColor3 = UIColor.red
            self.borderColor1 = UIColor.red
            self.borderColor2 = UIColor.red
            self.placeholderColor1 = UIColor.red
            self.placeholderColor2 = UIColor.red
            self.tintCustomColor = UIColor.red
        } else if colorID == 2 {
            self.textColor1 = UIColor.blue
            self.textColor2 = UIColor.blue
            self.textColor3 = UIColor.blue
            self.bgColor1 = UIColor.blue
            self.bgColor2 = UIColor.blue
            self.bgColor3 = UIColor.blue
            self.borderColor1 = UIColor.blue
            self.borderColor2 = UIColor.blue
            self.placeholderColor1 = UIColor.blue
            self.placeholderColor2 = UIColor.blue
            self.tintCustomColor = UIColor.blue
        }
        
    }

    
}
