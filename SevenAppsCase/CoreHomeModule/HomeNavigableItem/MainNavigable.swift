//
//  MainNavigable.swift
//  SevenAppsCase
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import UIKit.UIWindow

final class MainNavigable: StoryboardNavigableWithType {
    func isSatisfied(storyboardType: Any.Type?,
                     delegate: AnyObject?,
                     args: Any?) -> Bool {
        return storyboardType == HomeViewController.self
    }
    func execute(navigationController: UINavigationController?,
                 delegate: AnyObject?,
                 args: Any?) {
        let viewController =
        Main.instantiateViewController(ofType: HomeViewController.self)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
