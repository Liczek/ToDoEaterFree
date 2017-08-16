//
//  CategoryDetailTVC.swift
//  ToDoEaterFree
//
//  Created by Paweł Liczmański on 06.08.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

class CategoryDetailTVC: UITableViewController {
    
    let options = ["Category name", "Category icon"]
    
    var category = Catrgory(name: String(), iconName: String())
    
    var appColor = Colors()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Details"
        
        appColor.configureColors()
        
        tableView.register(CategoryNameEditTVCell.self, forCellReuseIdentifier: "categoryNameCell")
        tableView.register(CategoryImageEditTVCell.self, forCellReuseIdentifier: "categoryImageCell")
        
        tableView.backgroundColor = appColor.bgColor1
        let dummyView = UIView()
        dummyView.layer.borderWidth = 1
        dummyView.layer.borderColor = appColor.borderColor1.cgColor
        tableView.tableFooterView = dummyView

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 15
        } else if section == 1 {
            return 15
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIImageView()
        header.backgroundColor = appColor.bgColor1
        header.layer.borderWidth = 1
        header.layer.borderColor = appColor.borderColor1.cgColor
        
        return header
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Header test"
//    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "categoryNameCell") as! CategoryNameEditTVCell
            cell.nameTextField.text = category.categoryName
            return cell
        } else if indexPath.section == 1 && indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "categoryImageCell") as! CategoryImageEditTVCell
            let imageName = self.category.categoryImage
            cell.categoryImage.image = UIImage(named: imageName)
            cell.goButton.addTarget(self, action: #selector(goButtonTapped), for: UIControlEvents.touchUpInside)
            return cell
        } else {
            let dummyCell = UITableViewCell(style: .default, reuseIdentifier: "random")
            dummyCell.backgroundColor = appColor.bgColor1
            return dummyCell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let currentIconName = category.categoryImage
        print("Category Detail \(currentIconName)")
        performSegue(withIdentifier: "showIconPicker", sender: currentIconName)
    }
    
    func goButtonTapped() {
        performSegue(withIdentifier: "showIconPicker", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 40
        } else if indexPath.section == 1 {
            return 100
        } else {
            return 55
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showIconPicker"{
            let controller = segue.destination as! CategoryIconPickerTVC
            controller.currentIcon = sender as! String
        }
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
