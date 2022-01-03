//
//  CityObject.swift
//  SquareOne
//
//  Created by David Garcia on 2/1/22.
//

import Foundation
import RealmSwift

class CityObject: Object {
    @Persisted(primaryKey: true) var id: Int = 0
    @Persisted var name: String = ""
    @Persisted var localName: String = ""
    @Persisted var lat: Double? = nil
    @Persisted var lng: Double? = nil
    @Persisted var createdAt: String = ""
    @Persisted var updatedAt: String = ""
    @Persisted var countryID: Int = 0
    @Persisted var country: CountryObject? = nil
}
