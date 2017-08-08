//
//  UITextFieldWithInsets.swift
//  ToDoEaterFree
//
//  Created by Paweł Liczmański on 08.08.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

class UITextFieldWithInsets: UITextField {
    
    var leftInset: CGFloat = 5.0
    var topInset: CGFloat = 2.0
    var rightInset: CGFloat = 5.0
    var bottomInset: CGFloat = 2.0
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let insetValue = UIEdgeInsetsMake(topInset, leftInset, bottomInset, rightInset)
        return UIEdgeInsetsInsetRect(bounds, insetValue)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let insetValue = UIEdgeInsetsMake(topInset, leftInset, bottomInset, rightInset)
        return UIEdgeInsetsInsetRect(bounds, insetValue)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let insetValue = UIEdgeInsetsMake(topInset, leftInset, bottomInset, rightInset)
        return UIEdgeInsetsInsetRect(bounds, insetValue)
    }

}
