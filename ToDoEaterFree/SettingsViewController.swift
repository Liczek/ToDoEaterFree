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
    
    public var colorID = Int() {
        didSet {
            UserDefaults.standard.set(colorID, forKey: "ActualColorOfApplication")
            
            for (index, element) in colors.enumerated() {
                element.isActive = colorID == index
            }
        }
    }
    var colors = [AppColorPicker]()
    var settingsSections = ["Application Color Test","Date Style","Language"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(SettingsHeader.self, forHeaderFooterViewReuseIdentifier: "settingsHeader")
        
        colors.append(AppColorPicker(colorName: "Green", isActive: false, color: AppColors.init(colorId: 0)))
        colors.append(AppColorPicker(colorName: "Red", isActive: false, color: AppColors.init(colorId: 1)))
        colors.append(AppColorPicker(colorName: "Blue", isActive: false, color: AppColors.init(colorId: 2)))
        
        colorID = UserDefaults.standard.integer(forKey: "ActualColorOfApplication")
        colors[colorID].isActive = true
        
        configureSettingViewColors()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(configureHeadersAfterSwitchToggle), name: Notification.Name("NewColorIDIsSet"), object: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return settingsSections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRows = Int()
        if section == 0 {
            numberOfRows = colors.count
        }
        if section == 1 {
            numberOfRows = 0
        }
        if section == 2 {
            numberOfRows = 0
        }
        return numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! ColorTableViewCell
        
        let color = colors[indexPath.row]
        cell.switchItem.isOn = color.isActive
        if cell.switchItem.isOn {
            cell.switchItem.isEnabled = false
        }
        cell.nameLabel.textColor = color.color.black
        cell.backgroundColor = colors[colorID].color.bgColor1
        cell.switchItem.onTintColor = color.color.bgColor3
        cell.nameLabel.text = color.name
        cell.switchItem.tintColor = UIColor.black
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "settingsHeader") as! SettingsHeader
        let color = colors[colorID].color
        
        func configureSectionHeader() {
            sectionHeader.contentView.backgroundColor = color.bgColor3
            sectionHeader.sectionNameLabel.textColor = color.black
            sectionHeader.sectionNameLabel.text = settingsSections[section]
            sectionHeader.sectionNameLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
            sectionHeader.headerBackground.backgroundColor = color.bgColor2
        }
        
        if section == 0 {
            configureSectionHeader()
        }
        if section == 1 {
            configureSectionHeader()
        }
        if section == 2 {
            configureSectionHeader()
        }
        return sectionHeader
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 25
    }
    
    func cellDidToggle(_ cell: ColorTableViewCell, toggle switchState: Bool) {
        colorID = (tableView.indexPath(for: cell)?.row)!
        
        for colorCell in tableView.visibleCells as! [ColorTableViewCell] {
            let color = colors[colorID].color
            colorCell.backgroundColor = color.bgColor1
            if colorCell != cell {
                colorCell.switchItem.setOn(false, animated: true)
                colorCell.switchItem.isEnabled = true
            } else {
                cell.switchItem.isEnabled = false
                NotificationCenter.default.post(name: Notification.Name("NewColorIDIsSet"), object: nil)
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
    
    func configureHeadersAfterSwitchToggle() {
        print("refresh headers color")
        let color = colors[colorID].color
        for sectionIndex in 0..<settingsSections.count {
            if let cell = tableView.headerView(forSection: sectionIndex) {
                let header = cell as! SettingsHeader
                header.contentView.backgroundColor = color.bgColor3
                header.headerBackground.backgroundColor = color.bgColor2
            }
            
        }
    }
    
}
