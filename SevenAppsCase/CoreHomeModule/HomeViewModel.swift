//
//  HomeViewModel.swift
//  SevenAppsCase
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import Foundation

protocol HomeViewModelInterface: AnyObject {
    var numberOfSections: Int { get }
    var storyboardNavigableManager: StoryboardNavigableManager { get }
    var users: [UserArguments] { get set }
    
    func viewWillAppear()
    func viewDidLoad()
    func registerHomeCard()
    func numberOfItemsInSection(section: Int) -> Int
    func fetchHomeCards()
}

final class HomeViewModel {
    private weak var view: HomeViewInterface?
    private let userRepository: UserRepositoryProtocol
    internal var storyboardNavigableManager: StoryboardNavigableManager
    internal var users: [UserArguments] = []

    public init(view: HomeViewInterface = HomeViewController(),
                storyboardNavigableManager: StoryboardNavigableManager = StoryboardNavigableManager.shared,
                userRepository: UserRepositoryProtocol = UserRepository()) {
        self.view = view
        self.storyboardNavigableManager = storyboardNavigableManager
        self.userRepository = userRepository
    }
}
// MARK: - HomeViewModelInterface
extension HomeViewModel: HomeViewModelInterface {
    var numberOfSections: Int { 1 }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return users.isEmpty ? 0 : users.count
    }
    func viewWillAppear() {
        fetchHomeCards()
    }
    func viewDidLoad() {
        
    }
    func registerHomeCard() {
        view?.registerTableCellNibFlexible([(HomeTableViewCell.self, true)])
    }
    func fetchHomeCards() {
        view?.showProgress()
        Task {
            do {
                users = try await userRepository.fetchUsers()
                view?.removeProgress()
                view?.setVisibilityTableView()
                view?.reloadTableView()
            } catch {
                view?.removeProgress()
                view?.showAlert(title: nil,
                                message: error.localizedDescription,
                                buttonText: nil,
                                handler: nil)
            }
        }
    }
}
