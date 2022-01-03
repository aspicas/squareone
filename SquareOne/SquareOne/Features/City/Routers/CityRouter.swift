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
        let router = CityRouter(view: controller)
        let presenter = CityPresenter(interactor: interactor,
                                      router: router)
        controller.presenter = presenter
        return controller
    }
    
    private var view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func goToMap(cities: [City]) {
        let controller = MapRouter.makeView(cities: cities)
        view.present(controller, animated: true)
    }
}
