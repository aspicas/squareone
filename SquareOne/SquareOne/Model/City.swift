//
//  City.swift
//  SquareOne
//
//  Created by David Garcia on 31/12/21.
//

import Foundation

struct City: Codable {
    let id: Int
    let name, localName: String
    let lat, lng: Double?
    let createdAt: String
    let updatedAt: String
    let countryID: Int
    let country: Country?

    enum CodingKeys: String, CodingKey {
        case id, name
        case localName = "local_name"
        case lat, lng
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case countryID = "country_id"
        case country
    }
}
