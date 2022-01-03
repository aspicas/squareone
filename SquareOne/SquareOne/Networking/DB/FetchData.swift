//
//  FetchData.swift
//  SquareOne
//
//  Created by David Garcia on 3/1/22.
//

import Foundation
import RealmSwift

class FetchData<T: HandleObjectProtocol> {
    private let results: Results<T.ManagedObject>
    private var databaseDispatch: DispatchQueue
    
    var count: Int {
        return results.count
    }
    
    init(_ results: Results<T.ManagedObject>, databaseDispatch: DispatchQueue) {
        self.results = results
        self.databaseDispatch = databaseDispatch
    }
    
    func values() -> [T] {
        databaseDispatch.sync {
            return results.map({T(managedObject: $0)})
        }
    }
}
