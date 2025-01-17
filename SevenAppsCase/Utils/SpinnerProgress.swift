//
//  SpinnerProgress.swift
//  SevenAppsCase
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import UIKit

// MARK: - SpinnerDisplayable Protocol
protocol SpinnerDisplayable {
    func showProgress()
    func removeProgress()
}

extension SpinnerDisplayable where Self: UIViewController {
    func showProgress() {
        DispatchQueue.main.async {
            if self.view.subviews.contains(where: { $0.tag == 999 }) {
                return
            }
            let spinnerView = UIView(frame: self.view.bounds)
            spinnerView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
            spinnerView.tag = 999
            let activityIndicator = UIActivityIndicatorView(style: .medium)
            activityIndicator.startAnimating()
            activityIndicator.color = .white
            activityIndicator.center = spinnerView.center
            spinnerView.addSubview(activityIndicator)
            self.view.addSubview(spinnerView)
            self.view.isUserInteractionEnabled = false
        }
    }
    func removeProgress() {
        DispatchQueue.main.async {
            if let spinnerView = self.view.subviews.first(where: { $0.tag == 999 }) {
                spinnerView.removeFromSuperview()
                self.view.isUserInteractionEnabled = true
            }
        }
    }
}
