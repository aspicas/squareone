//
//  Pagination.swift
//  SquareOne
//
//  Created by David Garcia on 31/12/21.
//

import Foundation

struct Pagination: Codable {
    let currentPage, lastPage, perPage, total: Int

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case lastPage = "last_page"
        case perPage = "per_page"
        case total
    }
}
