//
//  Stop.swift
//  Test_MT_App
//
//  Created by Кристина Баскакова on 28.02.2023.
//

import Foundation
import UIKit

struct Stop: Decodable {
  let id: String
  let name: String
  let types: [String]
  let type: String
  let lat: Double
  let lon: Double
  let routeNumber: String
  let isFavorite: Bool
  let mapIcon: String
  let routePath: [RoutePath]?
}

struct RoutePath: Decodable {
  let id: String
  let type: String
  let lastStopName: String
  let color: String
  let fontColor: String
  let cityShuttle: Bool
  let sberShuttle: Bool
  let electrobus: Bool
  let rateUrl: String?
  let externalForecast: [Forecast]
  let externalForecastTime: [ForecastTime]
//  let feature:
  let isFavorite: Bool
  let messages: [String]?
}


struct Forecast: Decodable {
  let time: Int
  let byTelemetry: Int
  let tmId: Int
  let routePathId: String
}

struct ForecastTime: Decodable {
  let time: Int
  let byTelemetry: Int
  let tmId: Int
  let routePathId: String
}
