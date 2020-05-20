//
//  TipperLabel.swift
//  Tipper
//
//  Created by Leonardo Diaz on 5/18/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

import UIKit

class TipperLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.updateFontTo(name: FontNames.avenirNext)
        self.textColor = .mainTextColor
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func updateFontTo(name: String){
        let size = self.font.pointSize
        self.font = UIFont(name: name, size: size)!
    }

}

class TipperLabelBold: TipperLabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.updateFontTo(name: FontNames.avenirNextMedium)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
