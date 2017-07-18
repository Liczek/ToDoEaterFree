//
//  ViewController.swift
//  ToDoEaterFree
//
//  Created by Paweł Liczmański on 15.07.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    
    @IBOutlet weak var bcgImageView: UIImageView!
    @IBOutlet weak var categoryTableView: UITableView!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logo = UIImage(named: "todoeater_logo") as UIImage?
        let imageView = UIImageView(image:logo)
        imageView.frame.size.width = 45;
        imageView.frame.size.height = 45;
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        
        self.navigationItem.titleView = imageView
        
        self.categoryTableView.separatorColor = UIColor.red.withAlphaComponent(0.3)
        self.categoryTableView.rowHeight = 64
        
        bcgImageView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension CategoryViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoryTableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryTableViewCell
        cell.categoryLogoImagView.image = UIImage(named:"camera")
        
        return cell
    }
    
}

