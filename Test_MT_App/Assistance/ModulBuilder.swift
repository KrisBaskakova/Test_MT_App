//
//  ModulBuilder.swift
//  Test_MT_App
//
//  Created by Кристина Баскакова on 02.03.2023.
//

import UIKit

protocol Builder {
  static func createBusViewController() -> UIViewController
}


class ModulBuilder: Builder {
  static func createBusViewController() -> UIViewController {
    let busStopModel = Stop(id: " ",
                            name: " ",
                            types: [],
                            type: " ",
                            lat: 0.0,
                            lon: 0.0,
                            routeNumber: " ",
                            isFavorite: false,
                            mapIcon: " ",
                            routePath: [])
    let busStopView = BusStopListViewController()
    let busStopPresenter = BusStopPresenter(busStopModel: busStopModel, busStopView: busStopView)
    busStopView.busStoprPesenter = busStopPresenter
    
    return busStopView
  }
  
 
  }
  

