//
//  camView.swift
//  OCR-Application
//
//  Created by Himanshu Churi on 7/29/20.
//  Copyright © 2020 Himanshu Churi. All rights reserved.
//

import UIKit

@IBDesignable

class camView: UIImageView {
    
    func customizeView(){
        layer.borderWidth = 1.0
        layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.cornerRadius = 10.0
    }
    
    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }

}
