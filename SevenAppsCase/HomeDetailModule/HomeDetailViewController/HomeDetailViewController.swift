//
//  HomeDetailViewController.swift
//  SevenAppsCase
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import UIKit

protocol HomeDetailViewInterface: AnyObject {
    var currentUserArguments: UserArguments? { get }
    
    func setUIAppearance()
    func setComponentsWithUserInformation()
}

final class HomeDetailViewController: UIViewController {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var webSiteLabel: UILabel!
    @IBOutlet private weak var containerView: UIView!
    
    internal lazy var viewModel: HomeDetailViewModelInterface = HomeDetailViewModel(view: self)
    public var currentUserArguments: UserArguments?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
}
// MARK: - HomeDetailViewInterface
extension HomeDetailViewController: HomeDetailViewInterface {
    func setUIAppearance() {
        containerView.updateCorners(option: .all)
    }
    func setComponentsWithUserInformation() {
        guard let arguments = currentUserArguments else { return }
        let texts = [arguments.name, arguments.email, arguments.phone, arguments.website]
        let labels = [nameLabel, emailLabel, phoneLabel, webSiteLabel]
        zip(labels, texts).forEach { label, text in
            label?.text = text
        }
    }
}
