//
//  hideBarView.swift
//  ToDoEaterFree
//
//  Created by Paweł Liczmański on 20.07.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

class HideBar: UIView {
    
    var appColor = AppColors()
    var colorID = Int()
    
    var hideButton = UIButton()
    var isSlidedDown = true
    var onOffSegment = UISegmentedControl(items: ["Show all", "Hide empty"])
    var universalConstraints = [NSLayoutConstraint]()
    
    var onOffSegmentIndex = Int()

    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        addSubview(hideButton)
        addSubview(onOffSegment)
        
        configureHideBarUniversalConstraints()
        NSLayoutConstraint.activate(universalConstraints)
        
        configureAppColor()
        configureHideButton()
        configureOnOffSegment()
        configureColors()
    }
    
    
    func toggleSlideDown() {
        isSlidedDown = !isSlidedDown
    }
    
    
    func configureHideButton() {
        hideButton.setTitle("Hide empty catalogs", for: .normal)
        hideButton.titleLabel!.font = UIFont.systemFont(ofSize: 10)
        hideButton.addTarget(self, action: #selector(toggleSlideDown), for: .touchUpInside)
        
    }
    
    
    func configureOnOffSegment() {
        onOffSegment.layer.cornerRadius = 5
        onOffSegmentIndex = UserDefaults.standard.integer(forKey: "ActualIndexOfOnOffSegment")
        onOffSegment.selectedSegmentIndex = onOffSegmentIndex
        onOffSegment.addTarget(self, action: #selector(toggleCatalogs(sender:)), for: .valueChanged)
    }
    
    
    func configureColors() {
        onOffSegment.backgroundColor = appColor.bgColor1
        onOffSegment.tintColor = appColor.tintCustomColor
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
        onOffSegmentIndex = 0
        UserDefaults.standard.set(onOffSegmentIndex, forKey: "ActualIndexOfOnOffSegment")
    }
    
    
    func hideEmptyCatalogs() {
        print("Show Catalogs Mode OFF")
        onOffSegmentIndex = 1
        UserDefaults.standard.set(onOffSegmentIndex, forKey: "ActualIndexOfOnOffSegment")
    }
    
    
    func configureAppColor() {
        colorID = UserDefaults.standard.integer(forKey: "ActualColorOfApplication")
        appColor = AppColors.init(colorId: colorID)
        appColor.configureColors()
    }
    
    
    
    
    
}
