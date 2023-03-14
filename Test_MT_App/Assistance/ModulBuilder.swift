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
    let presenter = BusStopPresenter()
    let viewController = BusStopListViewController(output: presenter)
    presenter.view = viewController
    return viewController
  }
  
  static func createMapViewController(stop: Stop) -> UIViewController {
    let presenter = MapPresenter(stop: stop)
    let viewController = MapViewController(output: presenter)
    presenter.view = viewController
    return viewController
  }
  
}


