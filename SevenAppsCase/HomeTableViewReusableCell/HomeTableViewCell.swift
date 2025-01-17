//
//  HomeTableViewCell.swift
//  SevenAppsCase
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import UIKit

final class HomeTableViewCell: UITableViewCell {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUIAppearance()
    }
    private func setUIAppearance() {
        containerView.updateCorners(option: .all)
    }
    public func setUserArguments(_ arguments: UserArguments) {
        let texts = [arguments.name,
                     arguments.email]
        [nameLabel,
         emailLabel].enumerated().forEach { index, label in
            label.text = texts[index]
        }
    }
}
