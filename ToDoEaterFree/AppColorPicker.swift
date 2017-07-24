//
//  AppColorPicker.swift
//  ToDoEaterFree
//
//  Created by Paweł Liczmański on 24.07.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import Foundation
import UIKit

class AppColorPicker {
    var name = String()
    var isActive = Bool()
    var color = UIColor()
    
    init(colorName: String, isActive: Bool, color: UIColor) {
        self.name = colorName
        self.isActive = isActive
        self.color = color
    }
}
