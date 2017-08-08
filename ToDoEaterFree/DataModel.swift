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
        categories.append(Catrgory.init(name: "Dom", image: UIImage(named: "camera")!))
        categories.append(Catrgory.init(name: "Szkoła", image: UIImage(named: "camera")!))
        categories.append(Catrgory.init(name: "iMacs", image: UIImage(named: "camera")!))
        categories.append(Catrgory.init(name: "Development", image: UIImage(named: "camera")!))
        categories.append(Catrgory.init(name: "Praca", image: UIImage(named: "camera")!))
        categories.append(Catrgory.init(name: "Urodziny", image: UIImage(named: "camera")!))
        categories.append(Catrgory.init(name: "Kotki", image: UIImage(named: "camera")!))
    }
}
