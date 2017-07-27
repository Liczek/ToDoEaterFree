//
//  MainViewController.swift
//  ToDoEaterFree
//
//  Created by Paweł Liczmański on 17.07.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let searchBarView = SearchBar()
    let categoryTableView = UITableView()
    let hideBarView = HideBar()
    
    
    var defaults = UserDefaults.standard
    var colorID = Int()
    var curentAppColor = AppColors()
    
    
    var universalConstraints = [NSLayoutConstraint]()
    var hiddenBarConstraints = [NSLayoutConstraint]()
    var shownBarConstraints = [NSLayoutConstraint]()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureColors()
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSettingButton()

        self.view.addSubview(searchBarView)
        self.view.addSubview(hideBarView)
        configureUniversalConstraints()
        configureShownBarConstraints()
        configureHiddenBarConstraints()
        
        NSLayoutConstraint.activate(universalConstraints)
        
        configureColors()
        
        hideShowHideBar()
        
        hideBarView.hideButton.addTarget(self, action: #selector(hideShowHideBar), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureUniversalConstraints() {
        searchBarView.translatesAutoresizingMaskIntoConstraints = false
        hideBarView.translatesAutoresizingMaskIntoConstraints = false
        
        //searchBar
        universalConstraints.append(searchBarView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor))
        universalConstraints.append(searchBarView.widthAnchor.constraint(equalTo: view.widthAnchor))
        universalConstraints.append(searchBarView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08))
        universalConstraints.append(searchBarView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        //hideBar
        //universalConstraints.append(hideBarView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.bottomAnchor, constant: 0))
        universalConstraints.append(hideBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        universalConstraints.append(hideBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        universalConstraints.append(hideBarView.heightAnchor.constraint(equalToConstant: 40))
    }
    
    func configureShownBarConstraints() {
        //shownBarConstraints.append(hideBarView.heightAnchor.constraint(equalToConstant: 40))
        shownBarConstraints.append(hideBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
    }
    
    func configureHiddenBarConstraints() {
        //hiddenBarConstraints.append(hideBarView.heightAnchor.constraint(equalToConstant: 18))
        hiddenBarConstraints.append(hideBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 22))
    }
    
    
    func hideShowHideBar() {
        if !hideBarView.isSlidedDown {
            print("Main view Bar is Shown")
            UIView.animate(withDuration: 1) {
                NSLayoutConstraint.deactivate(self.hiddenBarConstraints)
                NSLayoutConstraint.activate(self.shownBarConstraints)
                self.hideBarView.layoutIfNeeded()
            }
            
        } else {
            print("Main view Bar is Hidden")
            UIView.animate(withDuration: 1) {
                NSLayoutConstraint.deactivate(self.shownBarConstraints)
                NSLayoutConstraint.activate(self.hiddenBarConstraints)
                self.hideBarView.layoutIfNeeded()
            }
            
        }
        
    }
    
    func setSettingButton() {
        let settingsLogo = UIImage(named: "settings")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: settingsLogo, style: UIBarButtonItemStyle.plain, target: self, action: #selector(goToSettingsView))
        
    }
   
    
    func goToSettingsView() {
        performSegue(withIdentifier: "goToSettings", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSettings" {
            _ = segue.destination as! SettingsViewController
        }
    }
    
    func configureColors() {
        colorID = defaults.integer(forKey: "ActualColorOfApplication")
        curentAppColor.colorID = self.colorID
        curentAppColor.configureColors()
        
        searchBarView.backgroundImage.backgroundColor = curentAppColor.bgColor3
        searchBarView.backgroundColor = curentAppColor.bgColor3
        hideBarView.backgroundColor = curentAppColor.bgColor3
        view.backgroundColor = curentAppColor.bgColor1
        navigationController?.navigationBar.tintColor = curentAppColor.tintCustomColor
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
