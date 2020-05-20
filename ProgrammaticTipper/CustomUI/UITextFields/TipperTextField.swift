//
//  TipperTextField.swift
//  Tipper
//
//  Created by Leonardo Diaz on 5/18/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

import UIKit

class TipperTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    
    func setupView(){
        self.layer.masksToBounds = true
        self.backgroundColor = .white
        self.addCornerRadius(10)
        self.textColor = .background
        self.addAccentBorder()
        self.updateFontTo(fontName: FontNames.avenirNext)
        self.updatePlaceHolder()
    }
    func updateFontTo(fontName: String){
        guard let size = self.font?.pointSize else { return }
        self.font = UIFont(name: fontName, size: size)
    }
    func updatePlaceHolder(){
        let currentPlaceholderText = self.placeholder
        self.attributedPlaceholder = NSAttributedString(string: currentPlaceholderText ?? "", attributes: [NSAttributedString.Key.font : UIFont(name: FontNames.avenirNext, size: 16)!])
    }
}
