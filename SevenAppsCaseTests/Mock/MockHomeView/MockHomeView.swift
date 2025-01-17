//
//  MockHomeView.swift
//  SevenAppsCaseTests
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import Foundation
import UIKit
@testable import SevenAppsCase

final class MockHomeView: HomeViewInterface {
    var tableView: UITableView! = UITableView()
    var progressShown = false
    var alertShown = false
    var tableReloaded = false
    var visibilityChanged = false
    var registeredCells: [(UITableViewCell.Type, Bool)] = []

    func showProgress() {
        progressShown = true
    }
    func removeProgress() {
        progressShown = false
    }
    func reloadTableView() {
        tableReloaded = true
    }
    func setVisibilityTableView() {
        visibilityChanged = true
    }
    func showAlert(title: String?,
                   message: String?,
                   buttonText: String?,
                   handler: AlertPresentableHandler?) {
        alertShown = true
    }
    func registerTableCellNibFlexible(_ cells: [(UITableViewCell.Type, Bool)]) {
        registeredCells = cells
    }
}
