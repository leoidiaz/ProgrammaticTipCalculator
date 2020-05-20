//
//  TipperStepper.swift
//  Tipper
//
//  Created by Leonardo Diaz on 5/18/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

import UIKit

class TipperStepper: UIStepper {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateUI()
        self.addCornerRadius(5)
     }
     
     required init?(coder: NSCoder) {
         super.init(coder: coder)
     }

    
    func updateUI(){
        self.backgroundColor = .mainTextColor
    }

}
