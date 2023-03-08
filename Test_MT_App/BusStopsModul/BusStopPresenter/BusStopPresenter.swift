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
  
}

protocol BusStopPresenterProtocol: AnyObject {
  init(busStopModel: Stop, busStopView: BusStopViewProtocol)
  func getStops() -> [CLLocation]
  
}

class BusStopPresenter: BusStopPresenterProtocol {
  
  let busStopModel: Stop
  let busStopView: BusStopViewProtocol
  var busStopCoordinates: [CLLocation] = []
 
  required init(busStopModel: Stop, busStopView: BusStopViewProtocol) {
    self.busStopView = busStopView
    self.busStopModel = busStopModel
  }
  
  func getStops() -> [CLLocation] {
    NetworkService.shared.getStopsFromApi { [weak self] stops in
      //self?.showStops(stops)
      
      for coordinate in stops {
        let busStopCoordinates = CLLocation(latitude: coordinate.lat, longitude: coordinate.lon)
    
        self?.busStopCoordinates.append(busStopCoordinates)
      }
    } failure: { error in
      print("error -> \(error)")
    }
    return self.busStopCoordinates
  }
  
  func showStops(_ stops: [Stop]) {
    // Show on map
  }
  
}
