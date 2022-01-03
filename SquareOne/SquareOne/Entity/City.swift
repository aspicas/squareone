//
//  City.swift
//  SquareOne
//
//  Created by David Garcia on 31/12/21.
//

import Foundation
import RealmSwift

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

extension City: HandleObjectProtocol {
    init(managedObject: CityObject) {
        id = managedObject.id
        name = managedObject.name
        localName = managedObject.localName
        lat = managedObject.lat
        lng = managedObject.lng
        createdAt = managedObject.createdAt
        updatedAt = managedObject.updatedAt
        countryID = managedObject.countryID
        if let countryObject = managedObject.country {
            country = Country(managedObject: countryObject)
        } else {
            country = nil
        }
    }
    
    func managedObject() -> CityObject {
        let object = CityObject()
        
        object.id = id
        object.name = name
        object.localName = localName
        object.lat = lat
        object.lng = lng
        object.createdAt = createdAt
        object.updatedAt = updatedAt
        object.countryID = countryID
        if let country = country {
            object.country = CountryObject(id: country.id,
                                           name: country.name,
                                           code: country.code,
                                           createdAt: country.createdAt,
                                           updateAt: country.updatedAt,
                                           continentID: country.continentID)
        } else {
            object.country = nil
        }
        
        return object
    }
}
