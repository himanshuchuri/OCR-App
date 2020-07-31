
//
//  okBtn.swift
//  OCR-Application
//
//  Created by Himanshu Churi on 7/29/20.
//  Copyright © 2020 Himanshu Churi. All rights reserved.
//

import UIKit

class okBtn: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func loadView() {
        layer.cornerRadius = 10.0
        backgroundColor = #colorLiteral(red: 0, green: 0.5356724884, blue: 1, alpha: 1)
        
    }
    
    override func prepareForInterfaceBuilder() {
        loadView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadView()
    }

}
