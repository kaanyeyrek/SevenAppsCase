//
//  NetworkError.swift
//  SevenAppsCase
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import Foundation

public enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case noData
    case decodingError(Error)
    case serverError(Int)
    case unknown(Error)
}
