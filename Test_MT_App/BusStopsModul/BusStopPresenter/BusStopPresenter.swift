//
//  BusStopPresenter.swift
//  Test_MT_App
//
//  Created by Кристина Баскакова on 02.03.2023.
//

import Foundation
import UIKit
import CoreLocation

protocol BusStopViewProtocol: AnyObject {
  var stops: [Stop]? { get set }
}

protocol BusStopPresenterProtocol: AnyObject {
  func viewDidLoad()
}

final class BusStopPresenter {
  
  weak var view: BusStopViewProtocol?
  
}

extension BusStopPresenter: BusStopPresenterProtocol {
  func viewDidLoad() {
    NetworkService.shared.getStopsFromApi { [weak self] stops in
      self?.view?.stops = stops
    } failure: { _ in
    }

  }
}
