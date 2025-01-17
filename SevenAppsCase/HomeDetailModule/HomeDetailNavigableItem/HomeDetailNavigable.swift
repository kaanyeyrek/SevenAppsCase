//
//  HomeDetailNavigable.swift
//  SevenAppsCase
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import UIKit.UIWindow

final class HomeDetailNavigable: StoryboardNavigableWithType {
    func isSatisfied(storyboardType: Any.Type?,
                     delegate: AnyObject?,
                     args: Any?) -> Bool {
        return storyboardType == HomeDetailViewController.self
    }
    func execute(navigationController: UINavigationController?,
                 delegate: AnyObject?,
                 args: Any?) {
        let viewController =
        HomeDetail.instantiateViewController(ofType: HomeDetailViewController.self)
        viewController.currentUserArguments = args as? UserArguments
        navigationController?.pushViewController(viewController, animated: true)
    }
}
