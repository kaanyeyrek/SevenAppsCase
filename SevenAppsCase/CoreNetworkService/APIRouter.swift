//
//  APIRouter.swift
//  SevenAppsCase
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import Foundation

public enum APIRouter {
    func asURLRequest() throws -> URLRequest {
        guard let base = URL(string: NetworkConstants.baseUrl)
        else {
            throw NetworkError.invalidURL
        }
        let url = base.appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
    
    case getUsers
    
    var path: String {
        switch self {
        case .getUsers:
            return "users"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .getUsers:
            return .get
        }
    }
}
