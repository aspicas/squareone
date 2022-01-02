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
    
    init(provider: SquareProviderProtocol) {
        self.provider = provider
        page = 0
        lastPage = Int.max
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
                completion(.success(cityInfo.items))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    
    func resetPagination() {
        page = 0
        lastPage = Int.max
    }
}
