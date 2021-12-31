//
//  Country.swift
//  SquareOne
//
//  Created by David Garcia on 31/12/21.
//

import Foundation

struct Country: Codable {
    let id: Int
    let name, code: String
    let createdAt, updatedAt: String
    let continentID: Int

    enum CodingKeys: String, CodingKey {
        case id, name, code
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case continentID = "continent_id"
    }
}
