//
//  MapViewController.swift
//  Test_MT_App
//
//  Created by Кристина Баскакова on 28.02.2023.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
  
  private lazy var mapView = MKMapView()
  let locationManager = CLLocationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupLocationManager()
    getCurentLocation()
 
  }
  
  private func setupUI() {
    view.addSubview(mapView)
    mapView.translatesAutoresizingMaskIntoConstraints = false
    mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
  }
  
  func getCurentLocation() {
    locationManager.requestWhenInUseAuthorization()
  }
  
  func setupLocationManager() {
    locationManager.delegate = self
  }
  
}

extension MapViewController: CLLocationManagerDelegate {
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let locationValue: CLLocationCoordinate2D = locationManager.location?.coordinate else { return }
    
    print("Location = \(locationValue.latitude), \(locationValue.longitude)")
  }
  
  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    if CLLocationManager.locationServicesEnabled() {
      locationManager.startUpdatingLocation()
    } else {
      let alert = UIAlertController(title: "Doesn't have the access to you location", message: "Please enable access to you geoposition", preferredStyle: .alert)
      let settingsAction = UIAlertAction(title: "Settings", style: .default) { (alert) in
        if let url = URL(string: "App-Prefs:root=LOCATION=SERVICES") {
          UIApplication.shared.open(url)
        }
      }
      let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
      
      alert.addAction(settingsAction)
      alert.addAction(cancelAction)
      
      present(alert, animated: true)
    }

  }
  
}
