//
//  MapPresenter.swift
//  Test_MT_App
//
//  Created by Кристина Баскакова on 03.03.2023.
//

import Foundation
import CoreLocation

protocol MapViewProtocol: AnyObject {
  var stop: Stop? { get set }
}

protocol MapPresenterProtocol: AnyObject {
  func viewDidLoad()
}

final class MapPresenter {
  
  let stop: Stop
  
  weak var view: MapViewProtocol?
  
  init(stop: Stop) {
    self.stop = stop
  }
 
}

extension MapPresenter: MapPresenterProtocol {
  func viewDidLoad() {
    view?.stop = stop
  }
}
