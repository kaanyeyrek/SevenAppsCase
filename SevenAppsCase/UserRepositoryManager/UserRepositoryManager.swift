//
//  UserRepositoryManager.swift
//  SevenAppsCase
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import Foundation

public protocol UserRepositoryProtocol {
    func fetchUsers() async throws -> [UserArguments]
}

public final class UserRepository: UserRepositoryProtocol {
    private let networkService: CoreNetworkServiceProtocol
    
    init(networkService: CoreNetworkServiceProtocol = CoreNetworkService.shared) {
        self.networkService = networkService
    }
    
    public func fetchUsers() async throws -> [UserArguments] {
        return try await networkService.request(endpoint: .getUsers,
                                                responseType: [UserArguments].self)
    }
}
