//
//  Network.swift
//  Test_MT_App
//
//  Created by Кристина Баскакова on 28.02.2023.
//

import Foundation
import CoreLocation

final class NetworkService {
  
  static let shared = NetworkService()
  var locationsCoordinates: [CLLocation] = []
  
  func getStops(success: @escaping ([Stop]) -> Void, failure: @escaping (Error?) -> Void) {
    guard let url = URL(string: "https://api.mosgorpass.ru/v8.2/stop/near_v2?p=55,558741,37,378847")
    else { return }
    
    let request = URLRequest(url: url)
    URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        failure(error)
        return
      }
      
      do {
        let stops = try JSONDecoder().decode([Stop].self, from: data)
        success(stops)
        
      } catch {
        failure(error)
      }
      
    }.resume()
  }
  
  
  
  
  func getData() -> [StopsModel]{
    let data = stopsData
    
    return data
  }
}


let stopsData: [StopsModel] = [
  StopsModel(
    name: "Зябликово",
    type: "Автобус",
    lattitude: 10.3,
    longtitude: 20.3,
    routNumber: 45),
  StopsModel(
    name: "Спортивная школа",
    type: "Автобус",
    lattitude: 23.6,
    longtitude: 66.4,
    routNumber: 222),
  StopsModel(
    name: "Оптика",
    type: "Автобус",
    lattitude: 43.6,
    longtitude: 76.4,
    routNumber: 189),
  StopsModel(
    name: "Метро Чертановская",
    type: "Автобус",
    lattitude: 21.8,
    longtitude: 55.7,
    routNumber: 28),
]
