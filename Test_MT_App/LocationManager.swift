//
//  LocationManager.swift
//  Test_MT_App
//
//  Created by Кристина Баскакова on 07.03.2023.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject, CLLocationManagerDelegate {
  
  static let shared = LocationManager()
  
  let locationManager = CLLocationManager()
  var comletion: ((CLLocation) -> Void)?
  
  public func getCurrentLocation(comletion: @escaping ((CLLocation) -> Void)) {
    self.comletion = comletion
    locationManager.requestWhenInUseAuthorization()
    locationManager.delegate = self
    locationManager.startUpdatingLocation()
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.first else { return }
    comletion?(location)
    locationManager.stopUpdatingLocation()
  }
}


