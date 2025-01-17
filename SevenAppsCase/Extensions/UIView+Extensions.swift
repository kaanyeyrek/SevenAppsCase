//
//  UIView+Extensions.swift
//  SevenAppsCase
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import UIKit

enum CornerOption {
    case all
    case onlyBottom
    case onlyTop
    case none
}
extension UIView {
    func updateCorners(option: CornerOption, radius: CGFloat = 20) {
        switch option {
        case .onlyBottom:
            self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .onlyTop:
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        case .all:
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .none:
            self.layer.maskedCorners = []
            self.layer.cornerRadius = 0
        }
        self.layer.cornerRadius = radius
    }
}
