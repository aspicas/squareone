//
//  CityInteractor.swift
//  SquareOne
//
//  Created by David Garcia on 31/12/21.
//

import Foundation

class CityInteractor {
    private var provider: SquareProviderProtocol
    private var page: Int
    private var lastPage: Int
    private var db: DatabaseProtocol
    
    init(provider: SquareProviderProtocol) {
        self.provider = provider
        page = 0
        lastPage = Int.max
        db = RealmDatabase()
    }
    
    func getCity(filter: String,
                 completion: @escaping ((Result<[City], Error>) -> Void)) {
        page += 1
        if self.page > lastPage {
            return
        }
        provider.getCity(page: page,
                         include: "country",
                         filter: filter.lowercased()) { result in
            switch result {
            case .success(let cityInfo):
                self.lastPage = cityInfo.pagination.lastPage
                cityInfo.items.forEach { city in
                    self.db.add(object: city)
                }
                let cities = self.findCityData(filter: filter.lowercased())
                completion(.success(cities))
            case .failure(let error):
                self.page -= 1
                let cities = self.findCityData(filter: filter.lowercased())
                if cities.count > 0 {
                    completion(.success(cities))
                    return
                }
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    
    private func findCityData(filter: String) -> [City] {
        let predicate = filter.isEmpty ? nil : NSPredicate(format: "name CONTAINS[c] %@",
                                                           filter)
        let cities = self.db.getAll(type: City.self,
                                    filter: predicate,
                                    sort: "id")
        return cities.values()
    }
    
    func resetPagination() {
        page = 0
        lastPage = Int.max
    }
}
