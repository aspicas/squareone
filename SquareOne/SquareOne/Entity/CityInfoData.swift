//
//  CityInfoData.swift
//  SquareOne
//
//  Created by David Garcia on 31/12/21.
//

import Foundation

struct CityInfoData: Codable {
    let items: [City]
    let pagination: Pagination
}
