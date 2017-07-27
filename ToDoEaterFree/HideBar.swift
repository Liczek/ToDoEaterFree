//
//  hideBarView.swift
//  ToDoEaterFree
//
//  Created by Paweł Liczmański on 20.07.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

class HideBar: UIView {
    
    var curentAppColor = AppColors()
    var colorID = Int()
    
    var hideButton = UIButton()
    var isSlidedDown = true
    var onOffSegment = UISegmentedControl(items: ["Show empty", "Hide empty"])
    var universalConstraints = [NSLayoutConstraint]()
    var defaults = UserDefaults.standard
    
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        addSubview(hideButton)
        addSubview(onOffSegment)
        
        configureHideBarUniversalConstraints()
        NSLayoutConstraint.activate(universalConstraints)
        
        configureColors()
        configureHideButton()
        configureOnOffSegment()
        
    }
    
    func toggleSlideDown() {
        isSlidedDown = !isSlidedDown
    }
    
    func configureHideButton() {
        hideButton.setTitle("Hide empty catalogs", for: .normal)
        hideButton.titleLabel!.font = UIFont.systemFont(ofSize: 10)
        hideButton.addTarget(self, action: #selector(pressOrDragHideButton), for: .touchUpInside)
        
    }
    
    func pressOrDragHideButton() {
        print("button pressed or draged")
        toggleSlideDown()
    }
    
    
    
    func configureOnOffSegment() {
        //let segmentOptions = ["Show empty", "Hide empty"]
        //onOffSegment = UISegmentedControl(items: segmentOptions)
        onOffSegment.backgroundColor = curentAppColor.bgColor3
        onOffSegment.tintColor = curentAppColor.tintCustomColor
        onOffSegment.layer.cornerRadius = 5
        onOffSegment.selectedSegmentIndex = 0
        onOffSegment.addTarget(self, action: #selector(toggleCatalogs(sender:)), for: .valueChanged)
    }
    
    func toggleCatalogs(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1 :
            hideEmptyCatalogs()
        default:
            showEmptyCatalogs()
        }
    }
    
    func configureHideBarUniversalConstraints() {
        
        hideButton.translatesAutoresizingMaskIntoConstraints = false
        onOffSegment.translatesAutoresizingMaskIntoConstraints = false
        
        //hideButton
        universalConstraints.append(hideButton.leadingAnchor.constraint(equalTo: leadingAnchor))
        universalConstraints.append(hideButton.trailingAnchor.constraint(equalTo: trailingAnchor))
        universalConstraints.append(hideButton.heightAnchor.constraint(equalToConstant: 14))
        universalConstraints.append(hideButton.topAnchor.constraint(equalTo: topAnchor, constant: 2))
        //universalConstraints.append(hideButton.bottomAnchor.constraint(equalTo: onOffSegment.topAnchor, constant: -2))
        
        //onOffSegment
        //universalConstraints.append(onOffSegment.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2))
        universalConstraints.append(onOffSegment.topAnchor.constraint(equalTo: hideButton.bottomAnchor, constant: 2))
        universalConstraints.append(onOffSegment.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75))
        universalConstraints.append(onOffSegment.centerXAnchor.constraint(equalTo: centerXAnchor))
        universalConstraints.append(onOffSegment.heightAnchor.constraint(equalToConstant: 20))
        
    }

    func showEmptyCatalogs() {
        print("Show Catalogs Mode ON")
    }
    
    func hideEmptyCatalogs() {
        print("Show Catalogs Mode OFF")
    }
    
    func configureColors() {
        
        colorID = defaults.integer(forKey: "ActualColorOfApplication")
        curentAppColor.colorID = self.colorID
        curentAppColor.configureColors()
    }
    
    
    
    
    
}
