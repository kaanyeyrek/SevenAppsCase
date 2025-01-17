//
//  SevenAppsCaseTests.swift
//  SevenAppsCaseTests
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import XCTest
@testable import SevenAppsCase

final class CoreNetworkServiceTests: XCTestCase {
    var mockService: CoreNetworkServiceProtocol!
    
    override func setUp() {
        super.setUp()
        mockService = MockNetworkService()
    }
    override func tearDown() {
        mockService = nil
        super.tearDown()
    }
    
    func testRequestSuccess() async throws {
        let mockData = [UserArguments(name: "Test User",
                                      email: "test@example.com",
                                      phone: "123456",
                                      website: "www.example.com")]
        (mockService as? MockNetworkService)?.mockData = mockData
        let result: [UserArguments] =
        try await mockService.request(endpoint: .getUsers,
                                      responseType: [UserArguments].self)
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.name, "Test User")
    }
    func testRequestFailure() async throws {
        (mockService as? MockNetworkService)?.shouldReturnError = true
        do {
            let _: [UserArguments] =
            try await mockService.request(endpoint: .getUsers,
                                          responseType: [UserArguments].self)
            XCTFail("Request should fail")
        } catch {
            XCTAssertTrue(error is NetworkError)
        }
    }
}
