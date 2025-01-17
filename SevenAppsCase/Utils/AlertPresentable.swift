//
//  AlertPresentable.swift
//  SevenAppsCase
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import UIKit

public enum AlertActionType {
    case ok
    case cancel
}

public typealias AlertPresentableHandler = ((AlertActionType) -> Void)

public protocol AlertPresentable {
    func showAlert(title: String?,
                   message: String?,
                   buttonText: String?,
                   handler: AlertPresentableHandler?)
}

extension AlertPresentable where Self: UIViewController {
    func showAlert(title: String? = nil,
                   message: String? = nil,
                   buttonText: String? = nil,
                   handler: AlertPresentableHandler? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultButtonText = buttonText ?? "Okay"
        let okAction = UIAlertAction(title: defaultButtonText, style: .default) { _ in
            handler?(.ok)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            handler?(.cancel)
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
