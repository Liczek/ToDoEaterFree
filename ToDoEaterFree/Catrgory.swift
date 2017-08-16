//
//  DataModel.swift
//  ToDoEaterFree
//
//  Created by Paweł Liczmański on 08.08.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import Foundation
import UIKit

class Catrgory {
    
    var categoryName = String()
    var categoryImage = String()
    
    init(name: String, iconName: String) {
        categoryName = name
        categoryImage = iconName
    }
}
