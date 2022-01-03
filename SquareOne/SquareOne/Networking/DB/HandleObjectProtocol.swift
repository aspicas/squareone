//
//  HandleObjectProtocol.swift
//  SquareOne
//
//  Created by David Garcia on 2/1/22.
//

import Foundation
import RealmSwift

protocol HandleObjectProtocol {
    associatedtype ManagedObject: Object
    
    init(managedObject: ManagedObject)
    func managedObject() -> ManagedObject
}
