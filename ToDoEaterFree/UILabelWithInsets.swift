//
//  UILabelWithInsets.swift
//  ToDoEaterFree
//
//  Created by Paweł Liczmański on 08.08.2017.
//  Copyright © 2017 Paweł Liczmański. All rights reserved.
//

import UIKit

class UILabelWithInsets: UILabel {

    var leftInset: CGFloat = 5.0
    var topInset: CGFloat = 2.0
    var rightInset: CGFloat = 5.0
    var bottomInset: CGFloat = 2.0
    
    
    override func drawText(in rect: CGRect) {
        let insetValue = UIEdgeInsetsMake(topInset, leftInset, bottomInset, rightInset)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insetValue))
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += topInset + bottomInset
            contentSize.width += leftInset + rightInset
            return contentSize
        }
    }
    

}
