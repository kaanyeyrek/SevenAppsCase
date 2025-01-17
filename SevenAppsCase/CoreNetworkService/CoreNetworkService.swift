//
//  CoreNetworkService.swift
//  SevenAppsCase
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import Foundation

protocol CoreNetworkServiceProtocol {
    func request
    <T: Decodable>
    (endpoint: APIRouter,
     responseType: T.Type) async throws -> T
}

final class CoreNetworkService: CoreNetworkServiceProtocol {
    static let shared = CoreNetworkService()
    
    private init() {}
    
    func request
    <T: Decodable>
    (endpoint: APIRouter,
     responseType: T.Type) async throws -> T {
        let request = try endpoint.asURLRequest()
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode)
        else {
            throw NetworkError.serverError((response as? HTTPURLResponse)?.statusCode ?? -1)
        }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError(error)
        }
    }
}
