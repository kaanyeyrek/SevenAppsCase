//
//  MockUserRepository.swift
//  SevenAppsCaseTests
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import Foundation
@testable import SevenAppsCase

final class MockUserRepository: UserRepositoryProtocol {
    var shouldReturnError = false
    var mockUsers: [UserArguments] = []

    func fetchUsers() async throws -> [UserArguments] {
        if shouldReturnError {
            throw NetworkError.serverError(500)
        }
        return mockUsers
    }
}
