//
//  UITableView+Extensions.swift
//  SevenAppsCase
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import UIKit

protocol RegistrableTableCell {
    var tableView: UITableView! { get }
    
    func registerTableCellNibFlexible(_ cellsWithNib: [(UITableViewCell.Type, Bool)])
}

extension RegistrableTableCell {
    func registerTableCellNibFlexible(_ cellsWithNib: [(UITableViewCell.Type, Bool)]) {
        cellsWithNib.forEach { cellType, nibIncluded in
            let reuseIdentifier = String(describing: cellType)
            if nibIncluded {
                let nib = UINib(nibName: reuseIdentifier, bundle: nil)
                tableView?.register(nib, forCellReuseIdentifier: reuseIdentifier)
            } else {
                tableView?.register(cellType, forCellReuseIdentifier: reuseIdentifier)
            }
        }
    }
}

protocol TableViewReloadable {
    var tableView: UITableView! { get }
    func reloadTableView()
    func setVisibilityTableView()
}

extension TableViewReloadable {
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func setVisibilityTableView() {
        DispatchQueue.main.async {
            self.tableView.isHidden = false
        }
    }
}

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        let identifier = String(describing: T.self)
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Error: Cannot dequeue cell of type \(T.self) with identifier \(identifier)")
        }
        return cell
    }
}
