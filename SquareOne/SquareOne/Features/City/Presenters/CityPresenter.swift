//
//  CityPresenter.swift
//  SquareOne
//
//  Created by David Garcia on 31/12/21.
//

import Foundation

class CityPresenter {
    private var interactor: CityInteractor
    private var router: CityRouter
    
    init(interactor: CityInteractor,
         router: CityRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    func getCity(completion: @escaping ((Result<[City], Error>) -> Void)) {
        interactor.getCity(filter: "", forceUpdate: false, completion: completion)
    }
    
    func getCity(filter: String, completion: @escaping ((Result<[City], Error>) -> Void)) {
        interactor.getCity(filter: filter, forceUpdate: false, completion: completion)
    }
    
    func getCity(filter: String, forceUpdate: Bool, completion: @escaping ((Result<[City], Error>) -> Void)) {
        interactor.getCity(filter: filter, forceUpdate: forceUpdate, completion: completion)
    }
    
    func resetPagination() {
        interactor.resetPagination()
    }
    
    func goToMap(cities: [City]) {
        router.goToMap(cities: cities)
    }
}
