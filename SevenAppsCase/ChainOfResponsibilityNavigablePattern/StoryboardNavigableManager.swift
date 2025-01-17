//
//  StoryboardNavigableManager.swift
//  SevenAppsCase
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import UIKit.UIWindow

final class StoryboardNavigableManager {
    static let shared = StoryboardNavigableManager()
    
    private init() {}
    
    private let itemsWithType: [StoryboardNavigableWithType] = [MainNavigable(),
                                                                HomeDetailNavigable()]
    
    func pushWithType(storyboardType: Any.Type? = nil,
                      navigationController: UINavigationController? = nil,
                      delegate: AnyObject? = nil,
                      args: Any? = nil) {
        itemsWithType.first(where: {
            $0.isSatisfied(storyboardType: storyboardType,
                           delegate: delegate,
                           args: args)
        })?.execute(navigationController: navigationController,
                    delegate: delegate,
                    args: args)
    }
}
