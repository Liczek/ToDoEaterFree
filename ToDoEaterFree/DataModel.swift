//
//  DataModel.swift
//  ToDoEaterFree
//
//  Created by Paweł Liczmański on 08.08.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import Foundation
import UIKit

class DataModel {
    
    var categories = [Catrgory]()
    
    init() {
        configureCategories()
    }
    
    func configureCategories() {
        categories.append(Catrgory.init(name: "Dom", iconName: "camera"))
        categories.append(Catrgory.init(name: "Szkoła", iconName: "app"))
        categories.append(Catrgory.init(name: "iMacs", iconName: "compact"))
        categories.append(Catrgory.init(name: "Development", iconName: "television"))
        categories.append(Catrgory.init(name: "Praca", iconName: "view"))
        categories.append(Catrgory.init(name: "Urodziny", iconName: "compass"))
        categories.append(Catrgory.init(name: "Kotki", iconName: "alarm"))
    }
}
