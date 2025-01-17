//
//  StoryboardNavigable.swift
//  SevenAppsCase
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import UIKit

protocol StoryboardNavigableWithType {
    func isSatisfied(storyboardType: Any.Type?,
                     delegate: AnyObject?,
                     args: Any?) -> Bool
    func execute(navigationController: UINavigationController?,
                 delegate: AnyObject?,
                 args: Any?)
}
