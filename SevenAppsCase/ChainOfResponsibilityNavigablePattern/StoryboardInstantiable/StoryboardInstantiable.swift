//
//  StoryboardInstantiable.swift
//  SevenAppsCase
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import UIKit

protocol StoryboardInstantiable {
    static var storyboard: UIStoryboard { get }
    
    static func instantiateViewController<T: UIViewController>(ofType type: T.Type) -> T
}

extension StoryboardInstantiable {
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: String(describing: Self.self), bundle: nil)
    }
    
    static func instantiateViewController<T: UIViewController>(ofType type: T.Type) -> T {
        return storyboard.instantiateViewController(withIdentifier: String(describing: type)) as! T
    }
}

public struct Main: StoryboardInstantiable {}
public struct HomeDetail: StoryboardInstantiable {}
