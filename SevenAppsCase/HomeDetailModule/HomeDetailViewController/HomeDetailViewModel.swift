//
//  HomeDetailViewModel.swift
//  SevenAppsCase
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import Foundation

protocol HomeDetailViewModelInterface: AnyObject {
    func viewWillAppear()
    func viewDidLoad()
    func setUserDetailArguments()
}

final class HomeDetailViewModel {
    private weak var view: HomeDetailViewInterface?
    
    public init(view: HomeDetailViewInterface = HomeDetailViewController()) {
        self.view = view
    }
}
// MARK: - HomeDetailViewModelInterface
extension HomeDetailViewModel: HomeDetailViewModelInterface {
    func viewWillAppear() {
        setUserDetailArguments()
    }
    func viewDidLoad() {
        view?.setUIAppearance()
    }
    func setUserDetailArguments() {
        view?.setComponentsWithUserInformation()
    }
}
