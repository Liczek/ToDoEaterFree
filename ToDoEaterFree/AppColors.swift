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
    
    convenience init(colorId: Int) {
        self.init()
        
        colorID = colorId
        configureColors()
        
        return
    }
    
    func configureColors() {
        //green
        if colorID == 0 {
            self.textColor1 = UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 1)
            self.textColor2 = UIColor(red: 15/255, green: 229/255, blue: 15/255, alpha: 1)
            self.textColor3 = UIColor(red: 49/255, green: 197/255, blue: 49/255, alpha: 1)
            self.bgColor1 = UIColor(red: 207/255, green: 255/255, blue: 207/255, alpha: 1)
            self.bgColor2 = UIColor(red: 168/255, green: 247/255, blue: 168/255, alpha: 1)
            self.bgColor3 = UIColor(red: 108/255, green: 214/255, blue: 108/255, alpha: 1)
            self.borderColor1 = UIColor(red: 83/255, green: 249/255, blue: 83/255, alpha: 1)
            self.borderColor2 = UIColor(red: 2/255, green: 202/255, blue: 2/255, alpha: 1)
            self.placeholderColor1 = UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 0.5)
            self.placeholderColor2 = UIColor(red: 49/255, green: 197/255, blue: 49/255, alpha: 0.5)
            self.tintCustomColor = UIColor(red: 49/255, green: 197/255, blue: 49/255, alpha: 1)
        //red
        } else if colorID == 1 {
            self.textColor1 = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
            self.textColor2 = UIColor(red: 229/255, green: 15/255, blue: 15/255, alpha: 1)
            self.textColor3 = UIColor(red: 197/255, green: 49/255, blue: 49/255, alpha: 1)
            self.bgColor1 = UIColor(red: 255/255, green: 207/255, blue: 207/255, alpha: 1)
            self.bgColor2 = UIColor(red: 247/255, green: 168/255, blue: 168/255, alpha: 1)
            self.bgColor3 = UIColor(red: 214/255, green: 108/255, blue: 108/255, alpha: 1)
            self.borderColor1 = UIColor(red: 249/255, green: 83/255, blue: 83/255, alpha: 1)
            self.borderColor2 = UIColor(red: 202/255, green: 2/255, blue: 2/255, alpha: 1)
            self.placeholderColor1 = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 0.5)
            self.placeholderColor2 = UIColor(red: 197/255, green: 49/255, blue: 49/255, alpha: 0.5)
            self.tintCustomColor = UIColor(red: 197/255, green: 49/255, blue: 49/255, alpha: 1)
        //blue
        } else if colorID == 2 {
            self.textColor1 = UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 1)
            self.textColor2 = UIColor(red: 15/255, green: 15/255, blue: 229/255, alpha: 1)
            self.textColor3 = UIColor(red: 49/255, green: 49/255, blue: 197/255, alpha: 1)
            self.bgColor1 = UIColor(red: 207/255, green: 207/255, blue: 255/255, alpha: 1)
            self.bgColor2 = UIColor(red: 168/255, green: 168/255, blue: 247/255, alpha: 1)
            self.bgColor3 = UIColor(red: 108/255, green: 108/255, blue: 214/255, alpha: 1)
            self.borderColor1 = UIColor(red: 83/255, green: 83/255, blue: 249/255, alpha: 1)
            self.borderColor2 = UIColor(red: 2/255, green: 2/255, blue: 202/255, alpha: 1)
            self.placeholderColor1 = UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 0.5)
            self.placeholderColor2 = UIColor(red: 49/255, green: 49/255, blue: 197/255, alpha: 0.5)
            self.tintCustomColor = UIColor(red: 49/255, green: 49/255, blue: 197/255, alpha: 1)
        }
        
    }

    
}
