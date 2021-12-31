//
//  SquareProviderProtocol.swift
//  SquareOne
//
//  Created by David Garcia on 31/12/21.
//

import Foundation

protocol SquareProviderProtocol {
    func getCity(page: Int,
                 include: String,
                 filter: String,
                 completion: @escaping ((Result<CityInfoData, Error>) -> Void))
}
