//
//  MapRouter.swift
//  SquareOne
//
//  Created by David Garcia on 3/1/22.
//

import Foundation
import UIKit

class MapRouter {
    static func makeView(cities: [City]) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard
            .instantiateViewController(withIdentifier: "MapCityViewController")
            as! MapCityViewController
        controller.data = cities
        return controller
    }
}
