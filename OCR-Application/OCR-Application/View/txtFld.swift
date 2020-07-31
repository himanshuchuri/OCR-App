//
//  txtFld.swift
//  OCR-Application
//
//  Created by Himanshu Churi on 7/29/20.
//  Copyright © 2020 Himanshu Churi. All rights reserved.
//

import UIKit

@IBDesignable

class txtFld: UITextView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    
    func custView() {
        layer.cornerRadius = 10.0
        layer.borderWidth = 1.0
        layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2)
        textAlignment = .center
    }
    
    override func prepareForInterfaceBuilder() {
        custView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        custView()
    }
}
