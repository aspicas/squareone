//
//  CountryObject.swift
//  SquareOne
//
//  Created by David Garcia on 2/1/22.
//

import Foundation
import RealmSwift

class CountryObject: Object {
    @Persisted(primaryKey: true) var id: Int = 0
    @Persisted var name: String = ""
    @Persisted var code: String = ""
    @Persisted var createdAt: String = ""
    @Persisted var updatedAt: String = ""
    @Persisted var continentID: Int = 0
    
    override init() {
        super.init()
    }
    
    init(id: Int,
         name: String,
         code: String,
         createdAt: String,
         updateAt: String,
         continentID: Int) {
        self.id = id
        self.name = name
        self.code = code
        self.createdAt = createdAt
        self.updatedAt = updateAt
        self.continentID = continentID
    }
}
