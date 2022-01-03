//
//  MapCityViewController.swift
//  SquareOne
//
//  Created by David Garcia on 3/1/22.
//

import UIKit
import MapKit

class MapCityViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var backButton: UIButton!
    
    var data: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        setupButton()
        data.forEach { city in
            addAnnotation(city: city)
        }
    }
    
    private func setupMapView() {
        mapView.delegate = self
    }
    
    private func setupButton() {
        backButton.setTitle("", for: .normal)
    }
    
    private func addAnnotation(city: City) {
        if let lat = city.lat,
            let lon = city.lng {
            let annotation = MKPointAnnotation()
            annotation.title = city.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
            mapView.addAnnotation(annotation)
        }
    }
    
    @IBAction func backButtonTap(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}

extension MapCityViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView,
                 viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }

        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }

        return annotationView
    }
}
