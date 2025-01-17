//
//  HomeViewModelTests.swift
//  SevenAppsCaseTests
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import XCTest
@testable import SevenAppsCase

final class HomeViewModelTests: XCTestCase {
    var mockView: HomeViewInterface!
    var mockRepository: UserRepositoryProtocol!
    var viewModel: HomeViewModelInterface!

    override func setUp() {
        super.setUp()
        mockView = MockHomeView()
        mockRepository = MockUserRepository()
        viewModel = HomeViewModel(view: mockView,
                                  userRepository: mockRepository)
    }
    override func tearDown() {
        mockView = nil
        mockRepository = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testNumberOfItemsInSection() {
        viewModel.users = [UserArguments(id: 1,
                                         name: "User 1",
                                         email: nil,
                                         phone: nil,
                                         website: nil,
                                         address: nil,
                                         company: nil),
                           UserArguments(id: 2,
                                         name: "User 2",
                                         email: nil,
                                         phone: nil,
                                         website: nil,
                                         address: nil,
                                         company: nil)]
        let numberOfItems = viewModel.numberOfItemsInSection(section: 0)
        XCTAssertEqual(numberOfItems, 2,
                       "Number of items in section should match the users array count.")
    }
    @MainActor
    func testFetchHomeCardsSuccess() async {
        let expectation = XCTestExpectation(description: "fetchHomeCards should complete")
        let mockUsers = [UserArguments(id: 1,
                                       name: "Test User",
                                       email: "test@example.com",
                                       phone: "123456",
                                       website: "www.example.com",
                                       address: nil,
                                       company: nil)]
        (mockRepository as? MockUserRepository)?.mockUsers = mockUsers
        viewModel.fetchHomeCards()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            XCTAssertTrue((self.mockView as? MockHomeView)?.progressShown == false,
                          "Progress should have ended.")
            XCTAssertTrue((self.mockView as? MockHomeView)?.tableReloaded == true,
                          "reloadTableView should be called.")
            XCTAssertTrue((self.mockView as? MockHomeView)?.visibilityChanged == true,
                          "setVisibilityTableView should be called.")
            XCTAssertEqual(self.viewModel.users.count,
                           mockUsers.count,
                           "Users should match the mock data.")
            expectation.fulfill()
        }
        await fulfillment(of: [expectation], timeout: 3.0)
    }
    func testFetchHomeCardsFailure() {
        let expectation = XCTestExpectation(description: "fetchHomeCards should complete")
        (mockRepository as? MockUserRepository)?.shouldReturnError = true
        viewModel.fetchHomeCards()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            XCTAssertTrue((self.mockView as? MockHomeView)?.alertShown == true,
                          "showAlert should be called.")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
    func testRegisterHomeCard() {
        let expectation = XCTestExpectation(description: "registerHomeCard should complete")
        viewModel.registerHomeCard()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            XCTAssertTrue((self.mockView as? MockHomeView)?.registeredCells.isEmpty == false,
                          "Cells should be registered.")
            XCTAssertTrue((self.mockView as? MockHomeView)?.registeredCells.contains { $0.0 == HomeTableViewCell.self && $0.1 == true } == true,
                          "HomeTableViewCell should be registered.")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
}
