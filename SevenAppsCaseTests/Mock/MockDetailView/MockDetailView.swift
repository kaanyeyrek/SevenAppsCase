//
//  MockDetailView.swift
//  SevenAppsCaseTests
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import Foundation
import UIKit
@testable import SevenAppsCase

final class MockHomeDetailViewModel: HomeDetailViewModelInterface {
    var viewWillAppearCalled = false
    var viewDidLoadCalled = false
    var setUserDetailArgumentsCalled = false
    
    func viewWillAppear() {
        viewWillAppearCalled = true
    }
    func viewDidLoad() {
        viewDidLoadCalled = true
    }
    func setUserDetailArguments() {
        setUserDetailArgumentsCalled = true
    }
}

final class MockHomeDetailView: HomeDetailViewInterface {
    var currentUserArguments: UserArguments?
    var setUIAppearanceCalled = false
    var setComponentsWithUserInformationCalled = false
    
    func setUIAppearance() {
        setUIAppearanceCalled = true
    }
    func setComponentsWithUserInformation() {
        setComponentsWithUserInformationCalled = true
    }
}
