//
//  SquareService.swift
//  SquareOne
//
//  Created by David Garcia on 31/12/21.
//

import Foundation
import Moya

private let squareUrl = "http://connect-demo.mobile1.io/square1/connect/v1"

enum SquareService {
    case getCity(page: Int, include: String, filter: String)
}

extension SquareService: TargetType {
    var baseURL: URL {
        URL(string: squareUrl)!
    }
    
    var path: String {
        switch self {
        case .getCity:
            return "/city"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCity:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getCity(let page, let include, let filter):
            var params: [String: Any] = [:]
            if page > 0 {
                params["page"] = page
            }
            if !include.isEmpty {
                params["include"] = include
            }
            if !filter.isEmpty {
                params["filter[0][name][contains]"] = filter
            }
            return .requestParameters(parameters: params,
                                      encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
