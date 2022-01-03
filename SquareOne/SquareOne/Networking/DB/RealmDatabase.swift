//
//  RealmDatabase.swift
//  SquareOne
//
//  Created by David Garcia on 2/1/22.
//

import Foundation
import Realm
import RealmSwift

class RealmDatabase: DatabaseProtocol {
    private var database: Realm!
    private var databaseDispatch: DispatchQueue
    
    init() {
        do {
            self.databaseDispatch = DispatchQueue.main
            self.database = try Realm(configuration: .defaultConfiguration,
                                       queue: databaseDispatch)
        } catch let error {
            print("Database: \(error.localizedDescription)")
        }
    }
    
    func add<T>(object: T) where T : HandleObjectProtocol {
        databaseDispatch.sync {
            try! self.database.write({
                self.database.add(object.managedObject(), update: .modified)
            })
        }
    }
    
    func getAll<T>(type: T.Type,
                   filter: NSPredicate?,
                   sort: String) -> FetchData<T> where T: HandleObjectProtocol {
        databaseDispatch.sync {
            var results = self.database.objects(T.ManagedObject.self)
            if let filter = filter {
                results = results.filter(filter)
            }
            results = results.sorted(byKeyPath: sort)
            return FetchData(results, databaseDispatch: self.databaseDispatch)
        }
    }
}
