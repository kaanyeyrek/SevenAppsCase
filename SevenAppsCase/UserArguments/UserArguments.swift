//
//  UserArguments.swift
//  SevenAppsCase
//
//  Created by Kaan Yeyrek on 17.01.2025.
//

import Foundation

public struct UserArguments: Codable {
    let id: Int?
    let name: String?
    let email: String?
    let phone: String?
    let website: String?
    let address: Address?
    let company: Company?
    
    init(id: Int? = nil,
         name: String? = nil,
         email: String? = nil,
         phone: String? = nil,
         website: String? = nil,
         address: Address? = nil,
         company: Company? = nil) {
        self.id = id
        self.name = name
        self.email = email
        self.phone = phone
        self.website = website
        self.address = address
        self.company = company
    }
}
public struct Address: Codable {
    let street: String?
    let suite: String?
    let city: String?
    let zipcode: String?
    let geo: Geo?
}
public struct Geo: Codable {
    let lat: String?
    let lng: String?
}
public struct Company: Codable {
    let name: String?
    let catchPhrase: String?
    let bs: String?
}
