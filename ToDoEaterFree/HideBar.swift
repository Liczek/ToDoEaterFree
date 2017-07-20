//
//  hideBarView.swift
//  ToDoEaterFree
//
//  Created by Paweł Liczmański on 20.07.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

class HideBar: UIView {
    
    var hideButton = UIButton()
    var onOffSegment = UISegmentedControl(items: ["Show empty", "Hide empty"])
    var universalConstraints = [NSLayoutConstraint]()
    
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        addSubview(hideButton)
        addSubview(onOffSegment)
        
        configureHideBarUniversalConstraints()
        NSLayoutConstraint.activate(universalConstraints)
        
        configureHideButton()
        configureOnOffSegment()
        
        
        
        
    }
    
    func configureHideButton() {
        hideButton.setTitle("Hide empty catalogs", for: .normal)
        hideButton.titleLabel!.font = UIFont.systemFont(ofSize: 10)
    }
    
    func configureOnOffSegment() {
        //let segmentOptions = ["Show empty", "Hide empty"]
        //onOffSegment = UISegmentedControl(items: segmentOptions)
        onOffSegment.backgroundColor = UIColor.red
        onOffSegment.tintColor = UIColor.white
        onOffSegment.layer.cornerRadius = 5
        onOffSegment.selectedSegmentIndex = 0
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
    
    
    
    
    
    
}
