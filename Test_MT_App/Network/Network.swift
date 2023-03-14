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
  
  func getStopsFromApi(success: @escaping ([Stop]) -> Void, failure: @escaping (Error?) -> Void) {
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
}

