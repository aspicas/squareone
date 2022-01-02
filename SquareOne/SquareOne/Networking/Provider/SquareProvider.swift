//
//  SquareProvider.swift
//  SquareOne
//
//  Created by David Garcia on 31/12/21.
//

import Foundation
import Moya

class SquareProvider: SquareProviderProtocol {
    
    private let provider: MoyaProvider<SquareService> =
        MoyaProvider<SquareService>(callbackQueue: .global(qos: .background))
    private var previousRequests: [Cancellable] = []
    
    func getCity(page: Int,
                 include: String,
                 filter: String,
                 completion: @escaping ((Result<CityInfoData, Error>) -> Void)) {
        let checkPage = page > 0 ? page : 1
        cancelPreviousRequests()
        let request = provider.request(.getCity(
            page: checkPage,
            include: include,
            filter: filter)) { result in
            switch result {
            case .success(let response):
                do {
                    let cityInfo = try JSONDecoder().decode(CityInfo.self, from: response.data)
                    completion(.success(cityInfo.data))
                } catch {
                    completion(.failure(MappingError.badObjectMapping))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
        previousRequests.append(request)
    }
    
    private func cancelPreviousRequests() {
        previousRequests.forEach({$0.cancel()})
        previousRequests.removeAll()
    }
}
