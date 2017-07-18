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
    let hideBarView = UIView()
    
    var universalConstraints = [NSLayoutConstraint]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(searchBarView)
        configureUniversalConstraints()
        NSLayoutConstraint.activate(universalConstraints)
        searchBarView.backgroundColor = UIColor.red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureUniversalConstraints() {
        searchBarView.translatesAutoresizingMaskIntoConstraints = false
        
        universalConstraints.append(searchBarView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor))
        //universalConstraints.append(searchBarView.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        universalConstraints.append(searchBarView.widthAnchor.constraint(equalTo: view.widthAnchor))
        universalConstraints.append(searchBarView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15))
        universalConstraints.append(searchBarView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
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
