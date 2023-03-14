//
//  DetailView.swift
//  Test_MT_App
//
//  Created by Кристина Баскакова on 03.03.2023.
//

import UIKit
import MapKit


class DetailView: UIView {

  private var busStopNameLabel = UILabel()
  private var busRoutNumbersLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setingup(with model: Stop) {
    busStopNameLabel.text = "NAME"//model.name
    busStopNameLabel.font = .systemFont(ofSize: 12, weight: .regular)
    busRoutNumbersLabel.text = model.routeNumber
    busRoutNumbersLabel.font = .systemFont(ofSize: 12, weight: .regular)
  }
  
  private func setupUI() {
    setupConstraints()
    setupHierarchy()
  }
  
  private func setupHierarchy() {
    addSubview(busStopNameLabel)
    addSubview(busRoutNumbersLabel)
  }
  
  private func setupConstraints() {
    busStopNameLabel.translatesAutoresizingMaskIntoConstraints = false
//   busStopNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
    
    busRoutNumbersLabel.translatesAutoresizingMaskIntoConstraints = false
//    busRoutNumbersLabel.topAnchor.constraint(equalTo: busStopNameLabel.bottomAnchor, constant: 16).isActive = true
//    busRoutNumbersLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
//    busRoutNumbersLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
  }
}
