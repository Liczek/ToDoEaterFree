//
//  SettingsViewController.swift
//  ToDoEaterFree
//
//  Created by Paweł Liczmański on 24.07.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UITableViewController, ColorTableViewCellDelegate {
    
    var colorID = Int() {
        didSet {
            UserDefaults.standard.set(colorID, forKey: "ActualColorOfApplication")
            
            for (index, element) in colors.enumerated() {
                element.isActive = colorID == index
            }
        }
    }
    var colors = [AppColorPicker]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colors.append(AppColorPicker(colorName: "Green", isActive: false, color: AppColors.init(colorId: 0)))
        colors.append(AppColorPicker(colorName: "Red", isActive: false, color: AppColors.init(colorId: 1)))
        colors.append(AppColorPicker(colorName: "Blue", isActive: false, color: AppColors.init(colorId: 2)))
        
        colorID = UserDefaults.standard.integer(forKey: "ActualColorOfApplication")
        colors[colorID].isActive = true
        
        configureSettingViewColors()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! ColorTableViewCell
        
        let color = colors[indexPath.row]
        cell.switchItem.isOn = color.isActive
        cell.nameLabel.textColor = color.color.textColor1
        cell.backgroundColor = color.color.bgColor2
        cell.switchItem.onTintColor = color.color.bgColor2
        cell.textLabel?.text = color.name
        cell.switchItem.tintColor = UIColor.lightGray
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Application Color"
    }
    
    func cellDidToggle(_ cell: ColorTableViewCell, toggle switchState: Bool) {
        colorID = (tableView.indexPath(for: cell)?.row)!
        
        for colorCell in tableView.visibleCells as! [ColorTableViewCell] {
            if colorCell != cell {
                colorCell.switchItem.setOn(false, animated: true)
            }
        }
        
        configureSettingViewColors()
    }
    
    func configureSettingViewColors() {
        let color = colors[colorID]
        tableView.backgroundColor = color.color.bgColor3
        tableView.separatorColor = color.color.borderColor1
        navigationController?.navigationBar.tintColor = color.color.tintCustomColor
    }
}
