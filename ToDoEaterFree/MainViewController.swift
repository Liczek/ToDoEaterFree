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
    let hideBarView = HideBar()
    let mainTableView = MainTableView()
    let mainTableViewCell = MainTableViewCell()
    
    var colorID: Int = 0
    var appColor = AppColors()
        
    var universalConstraints = [NSLayoutConstraint]()
    var hiddenBarConstraints = [NSLayoutConstraint]()
    var shownBarConstraints = [NSLayoutConstraint]()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureAppColor()
        
        title = "ToDoEater"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(configureColorsAfterSwitchToggle), name: Notification.Name("NewColorIDIsSet"), object: nil)
        
        setSettingButton()

        self.view.addSubview(searchBarView)
        self.view.addSubview(hideBarView)
        self.view.addSubview(mainTableView)
        
        self.mainTableView.register(MainTableViewCell.self, forCellReuseIdentifier: "mainCell")
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        configureUniversalConstraints()
        configureShownBarConstraints()
        configureHiddenBarConstraints()
        
        NSLayoutConstraint.activate(universalConstraints)
        
        configureAppColor()
        configureMainVCColors()
        configureMainTableColors()
        
        hideShowHideBar()
        
        hideBarView.hideButton.addTarget(self, action: #selector(hideShowHideBar), for: .touchUpInside)
    }

    
    func configureUniversalConstraints() {
        searchBarView.translatesAutoresizingMaskIntoConstraints = false
        hideBarView.translatesAutoresizingMaskIntoConstraints = false
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        
        //searchBar
        universalConstraints.append(searchBarView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 2))
        universalConstraints.append(searchBarView.widthAnchor.constraint(equalTo: view.widthAnchor))
        universalConstraints.append(searchBarView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08))
        universalConstraints.append(searchBarView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        //hideBar
        universalConstraints.append(hideBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        universalConstraints.append(hideBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        universalConstraints.append(hideBarView.heightAnchor.constraint(equalToConstant: 40))
        
        //mainTable
        universalConstraints.append(mainTableView.topAnchor.constraint(equalTo: searchBarView.bottomAnchor, constant: 2))
        universalConstraints.append(mainTableView.bottomAnchor.constraint(equalTo: hideBarView.topAnchor, constant: -2))
        universalConstraints.append(mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        universalConstraints.append(mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor))        
        mainTableView.setContentHuggingPriority(UILayoutPriority.abs(501), for: UILayoutConstraintAxis.vertical)
        mainTableView.setContentCompressionResistancePriority(UILayoutPriority.abs(499), for: .vertical)
    }
    
    
    func configureShownBarConstraints() {
        shownBarConstraints.append(hideBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
    }
    
    
    func configureHiddenBarConstraints() {
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
    
    
    func configureAppColor() {
        colorID = UserDefaults.standard.integer(forKey: "ActualColorOfApplication")
        appColor = AppColors.init(colorId: colorID)
        appColor.configureColors()
    }
    
    
    func configureMainVCColors() {
        searchBarView.backgroundImage.backgroundColor = appColor.bgColor3
        searchBarView.backgroundColor = appColor.bgColor3
        hideBarView.backgroundColor = appColor.bgColor3
        view.backgroundColor = appColor.bgColor2
        navigationController?.navigationBar.tintColor = appColor.tintCustomColor
        navigationController?.navigationBar.isTranslucent = true
        //navigationController?.navigationBar.barTintColor = appColor.tintCustomColor
    }
    
    
    func configureMainTableColors() {
        mainTableView.backgroundColor = appColor.bgColor3
        mainTableView.separatorColor = appColor.borderColor2
    }
    
    
    func configureColorsAfterSwitchToggle() {
        configureAppColor()
        
        //MainTable
        for cell in mainTableView.visibleCells as! [MainTableViewCell] {
            cell.backgroundColor = appColor.bgColor1
            cell.descriptionLabel.textColor = appColor.textColor3
        }
        configureMainTableColors()
        configureMainVCColors()
        
        //SearchBar
        searchBarView.configureAppColor()
        searchBarView.configureColors()
        
        //HideBar
        hideBarView.configureAppColor()
        hideBarView.configureColors()
    }
    

}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! MainTableViewCell
        for _ in 0..<20 {
            cell.categoryNameLabel.text = "Wiersz testowy nr \(indexPath.row + 1)"
            cell.descriptionLabel.text = "Detail Text o indexie \(indexPath.row)"
            cell.backgroundColor = appColor.bgColor1
            cell.categoryNameLabel.textColor = appColor.universalTextColor
            cell.descriptionLabel.textColor = appColor.textColor3
        }        
        return cell
    }
    
    
}
