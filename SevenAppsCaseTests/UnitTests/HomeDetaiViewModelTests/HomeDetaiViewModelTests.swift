//
//  HomeDetaiViewModelTests.swift
//  SevenAppsCaseTests
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import XCTest
@testable import SevenAppsCase

final class HomeDetailViewModelTests: XCTestCase {
    var mockView: MockHomeDetailView!
    var viewModel: HomeDetailViewModelInterface!
    
    override func setUp() {
        super.setUp()
        mockView = MockHomeDetailView()
        viewModel = HomeDetailViewModel(view: mockView)
    }
    override func tearDown() {
        viewModel = nil
        mockView = nil
        super.tearDown()
    }
    
    func testViewDidLoad() {
        viewModel.viewDidLoad()
        XCTAssertTrue(mockView.setUIAppearanceCalled,
                      "setUIAppearance should be called in viewModel.")
    }
    func testViewWillAppear() {
        viewModel.viewWillAppear()
        XCTAssertTrue(mockView.setComponentsWithUserInformationCalled,
                      "setComponentsWithUserInformation should be called in viewModel.")
    }
    func testSetUserDetailArguments() {
        viewModel.setUserDetailArguments()
        XCTAssertTrue(mockView.setComponentsWithUserInformationCalled,
                      "setComponentsWithUserInformation should be called.")
    }
}
