//
//  CityRouter.swift
//  SquareOne
//
//  Created by David Garcia on 31/12/21.
//

import Foundation
import UIKit

class CityRouter {
    static func makeView() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard
            .instantiateViewController(withIdentifier: "ListCityViewController")
            as! ListCityViewController
        let interactor = CityInteractor(provider: SquareProvider())
        let presenter = CityPresenter(interactor: interactor)
        controller.presenter = presenter
        return controller
    }
}
