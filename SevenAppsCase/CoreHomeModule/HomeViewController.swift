//
//  ViewController.swift
//  SevenAppsCase
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import UIKit

protocol HomeViewItems: RegistrableTableCell,
                        SpinnerDisplayable,
                        TableViewReloadable,
                        AlertPresentable
{}

typealias HomeViewKit = HomeViewItems

protocol HomeViewInterface: AnyObject,
                            HomeViewKit {
  
}

final class HomeViewController: UIViewController {
    @IBOutlet internal weak var tableView: UITableView!
    
    internal lazy var viewModel: HomeViewModelInterface = HomeViewModel(view: self)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        viewModel.registerHomeCard()
    }
}
// MARK: - UICollectionViewDataSource
extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections
    }
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection(section: section)
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let userArguments = viewModel.users[indexPath.row]
        cell.setUserArguments(userArguments)
        return cell
    }
}
// MARK: - UITableViewDelegate Dynamic Height Methods
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let userArguments = viewModel.users[indexPath.row]
        viewModel.storyboardNavigableManager.pushWithType(storyboardType: HomeDetailViewController.self,
                                                          navigationController: navigationController,
                                                          args: userArguments)
    }
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView,
                   estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
// MARK: - HomeViewInterface
extension HomeViewController: HomeViewInterface {
    
}
