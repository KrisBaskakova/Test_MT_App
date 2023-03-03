//
//  BusStopPresenter.swift
//  Test_MT_App
//
//  Created by Кристина Баскакова on 02.03.2023.
//

import Foundation
import UIKit

protocol BusStopViewProtocol: AnyObject {
  
}

protocol BusStopPresenterProtocol: AnyObject {
  init(busStopView: BusStopViewProtocol, busStopModel: Stop)
  
  
}

class BusStopPresenter: BusStopPresenterProtocol {
  
  let busStopView: BusStopViewProtocol
  let busStopModel: Stop
  
  required init(busStopView: BusStopViewProtocol, busStopModel: Stop) {
    self.busStopView = busStopView
    self.busStopModel = busStopModel
  }
  
  func getStops() {
    NetworkService.shared.getStops { [weak self] stops in
      self?.showStops(stops)
      
    } failure: { error in
      print("error -> \(error)")
    }
  }
  func showStops(_ stops: [Stop]) {
    // Show on map
  }
  
}
