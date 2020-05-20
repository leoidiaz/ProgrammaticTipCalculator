//
//  StyleGuide.swift
//  Tipper
//
//  Created by Leonardo Diaz on 5/18/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

import UIKit

extension UIView {
    func addCornerRadius(_ radius: CGFloat = 5) {
        self.layer.cornerRadius = radius
    }
    func addAccentBorder(width: CGFloat = 1, color: UIColor = UIColor.mainTextColor){
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}

struct FontNames {
    static let avenirNext = "AvenirNext-Regular"
    static let avenirNextMedium = "AvenirNext-Medium"
}

extension UIColor {
    static let background = UIColor(named: "background")!
    static let mainTextColor = UIColor(named: "textLabel")!
    static let whiteCloud = UIColor(named: "whiteCloud")!
}
