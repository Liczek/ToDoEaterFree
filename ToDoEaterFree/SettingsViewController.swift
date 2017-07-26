//
//  SettingsViewController.swift
//  ToDoEaterFree
//
//  Created by Paweł Liczmański on 24.07.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UITableViewController {
    
    var defaults = UserDefaults.standard
    var colorID = Int()
    var curentAppColor = AppColors()
    
    
    
    var colors = [AppColorPicker]()
    var id = String()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        colorID = defaults.integer(forKey: "ActualColorOfApplication")
        curentAppColor.colorID = self.colorID
        curentAppColor.configureColors()
        
        colors[colorID].isActive = true
        tableView.backgroundColor = curentAppColor.bgColor1
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        colors.append(AppColorPicker(colorName: "Green", isActive: false, color: UIColor.green))
        colors.append(AppColorPicker(colorName: "Red", isActive: false, color: UIColor.red))
        colors.append(AppColorPicker(colorName: "Blue", isActive: false, color: UIColor.blue))
        
        
        
        }
    
    func toggle(sender: UISwitch) {
        id = sender.restorationIdentifier!
        let intID = Int(id)
        defaults.set(intID, forKey: "ActualColorOfApplication")
        print(intID!)
        
        
        let changedSwitch = tableView.cellForRow(at: IndexPath(row: Int(id)!, section: 0)) as! ColorTableViewCell
        
        let greenSwitch = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! ColorTableViewCell
        let redSwitch = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! ColorTableViewCell
        let blueSwitch = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as! ColorTableViewCell
        greenSwitch.switchItem.setOn(false, animated: true)
        redSwitch.switchItem.setOn(false, animated: true)
        blueSwitch.switchItem.setOn(false, animated: true)
        colors[0].isActive = false
        colors[1].isActive = false
        colors[2].isActive = false
        
        colors[Int(id)!].isActive = true
        changedSwitch.switchItem.setOn(true, animated: true)
        greenSwitch.switchItem.isEnabled = true
        redSwitch.switchItem.isEnabled = true
        blueSwitch.switchItem.isEnabled = true
        changedSwitch.switchItem.isEnabled = false
//        navigationController?.popViewController(animated: true)
        viewWillAppear(true)
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! ColorTableViewCell
        let color = colors[indexPath.row]
        if color.isActive == true {
            cell.switchItem.isOn = true
            cell.switchItem.isEnabled = false
        }
        cell.switchItem.restorationIdentifier = "\(indexPath.row)"
        cell.switchItem.addTarget(self, action: #selector(toggle), for: .valueChanged)
        cell.textLabel?.text = color.name
        cell.switchItem.onTintColor = color.color
        cell.switchItem.tintColor = UIColor.lightGray
        
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Application Color"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.section == 0 {
            return nil
        }
        return indexPath
    }
    
    
    
}
