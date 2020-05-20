//
//  TipperSwitch.swift
//  Tipper
//
//  Created by Leonardo Diaz on 5/18/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

import UIKit

class TipperSwitch: UISwitch {

    override init(frame: CGRect) {
         super.init(frame: frame)
        setupUI()
     }
     
     required init?(coder: NSCoder) {
         super.init(coder: coder)
     }
    
    func setupUI(){
        self.thumbTintColor = .whiteCloud
        self.onTintColor = .mainTextColor
    }
}
