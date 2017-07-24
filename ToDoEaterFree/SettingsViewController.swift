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
    //var colors = ["Red", "Blue", "Green"]
    
    var colors = [AppColorPicker]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colors.append(AppColorPicker(colorName: "Green", isActive: false, color: UIColor.green))
        colors.append(AppColorPicker(colorName: "Red", isActive: true, color: UIColor.red))
        colors.append(AppColorPicker(colorName: "Blue", isActive: false, color: UIColor.blue))
        
        
    
    }
    
    func toggle(sender: UISwitch) {
        let id: String = sender.restorationIdentifier!
        
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
        
        colors[Int(id)!].isActive = false
        changedSwitch.switchItem.setOn(true, animated: true)
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
    
    
    
    
}
