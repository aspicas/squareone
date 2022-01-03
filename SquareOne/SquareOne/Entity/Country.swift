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

extension Country: HandleObjectProtocol {
    init(managedObject: CountryObject) {
        id = managedObject.id
        name = managedObject.name
        code = managedObject.code
        createdAt = managedObject.createdAt
        updatedAt = managedObject.updatedAt
        continentID = managedObject.continentID
    }
    
    func managedObject() -> CountryObject {
        let object = CountryObject()
        object.id = id
        object.name = name
        object.code = code
        object.createdAt = createdAt
        object.updatedAt = updatedAt
        object.continentID = continentID
        return object
    }
}
