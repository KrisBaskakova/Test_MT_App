//
//  MapViewController.swift
//  Test_MT_App
//
//  Created by Кристина Баскакова on 28.02.2023.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MapViewProtocol {
  
  let output: MapPresenterProtocol
  
  var stop: Stop? {
    didSet {
      updateMap(with: stop)
    }
  }

  private lazy var mapView = MKMapView()
  private lazy var detailCard = DetailView()
  
  //MARK: Init
  
  init(output: MapPresenterProtocol) {
    self.output = output
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    output.viewDidLoad()
    setupUI()
    setupPins()
    mapView.delegate = self
  }
  
  func updateMap(with stop: Stop?) {
    guard let stop else { return }
    addMapPin(with: CLLocation(latitude: stop.lat, longitude: stop.lon))
  }
  
  // MARK: Pins setup
  
  private func setupPins() {

    
  }
  
  func addMapPin(with location: CLLocation) {
    
    let currentLocationPin = MKPointAnnotation()
    currentLocationPin.coordinate = location.coordinate
    mapView.setRegion(
      MKCoordinateRegion(
        center: location.coordinate,
        span: .init()
      ),
      animated: true
    )
    mapView.addAnnotation(currentLocationPin)
  }

// MARK: SetupUI
  
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
      detailCard.backgroundColor = .white
      detailCard.isHidden = true
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

// MARK: Extension

extension MapViewController: MKMapViewDelegate {
  func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
    detailCard.isHidden = false
  }
}
