//
//  DatabaseProtocol.swift
//  SquareOne
//
//  Created by David Garcia on 2/1/22.
//

import Foundation

protocol DatabaseProtocol {
    func add<T>(object: T) where T: HandleObjectProtocol
    func getAll<T>(type: T.Type, filter: NSPredicate?, sort: String) -> FetchData<T> where T: HandleObjectProtocol
}
