//
//  MockNetworkService.swift
//  SevenAppsCaseTests
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import Foundation
@testable import SevenAppsCase

final class MockNetworkService: CoreNetworkServiceProtocol {
    var shouldReturnError = false
    var mockData: [UserArguments] = []
    
    func request<T>(endpoint: APIRouter, responseType: T.Type) async throws -> T where T : Decodable {
        if shouldReturnError {
            throw NetworkError.serverError(500)
        }
        guard let result = mockData as? T else {
            throw NetworkError.decodingError(NSError(domain: "", code: -1, userInfo: nil))
        }
        return result
    }
}
