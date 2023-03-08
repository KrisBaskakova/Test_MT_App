//
//  MapViewController.swift
//  Test_MT_App
//
//  Created by Кристина Баскакова on 28.02.2023.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
  
  private lazy var mapView = MKMapView()
  private lazy var detailCard = UIView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    LocationManager.shared.getCurrentLocation { [weak self] location in
      DispatchQueue.main.async {
        guard let currentLocation = self else { return }
        currentLocation.addMapPin(with: location)
      }
    }
  }
  
  func addMapPin(with location: CLLocation) {
    
    let currentLocationPin = MKPointAnnotation()
    currentLocationPin.coordinate = location.coordinate
    mapView.setRegion(MKCoordinateRegion(center: location.coordinate,
                                                          span: MKCoordinateSpan(
                                                          latitudeDelta: 0.7,
                                                          longitudeDelta: 0.7)
                                                        ),
                                      animated: true)
    mapView.addAnnotation(currentLocationPin)
  }
    
    private func setupUI() {
      setupHeirarchy()
      setupCinfiguration()
      setupConstraints()
    }
    
    private func setupHeirarchy() {
      view.addSubview(mapView)
      view.addSubview(detailCard)
    }
    
    private func setupCinfiguration() {
      detailCard.layer.cornerRadius = 16
      detailCard.backgroundColor = .blue
    }
    
    private func setupConstraints() {
      setupTableViewConstraints()
      setupDetailCardConstraints()
    }
    
    private func setupTableViewConstraints() {
      mapView.translatesAutoresizingMaskIntoConstraints = false
      mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
      mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
      mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func setupDetailCardConstraints() {
      detailCard.translatesAutoresizingMaskIntoConstraints = false
      detailCard.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
      detailCard.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
      detailCard.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      detailCard.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
  }
