//
//  DetailView.swift
//  Test_MT_App
//
//  Created by Кристина Баскакова on 03.03.2023.
//

import UIKit
import MapKit


class DetailView: UIView {

  private lazy var busStopNameLabel = UILabel()
  private lazy var busRoutNumbersLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setingup(with model: Stop) {
    busStopNameLabel.text = model.name
    busStopNameLabel.font = .systemFont(ofSize: 18, weight: .bold)
    busRoutNumbersLabel.text = model.routeNumber
    busRoutNumbersLabel.font = .systemFont(ofSize: 14, weight: .regular)
  }
  
  private func setupUI() {
    setupHierarchy()
    setupConstraints()
  }
  
  private func setupHierarchy() {
    addSubview(busStopNameLabel)
    addSubview(busRoutNumbersLabel)
  }
  
  private func setupConstraints() {
    busStopNameLabel.translatesAutoresizingMaskIntoConstraints = false
    busStopNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
    busStopNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
    busStopNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16).isActive = true
    
    busRoutNumbersLabel.translatesAutoresizingMaskIntoConstraints = false
    busRoutNumbersLabel.topAnchor.constraint(equalTo: busStopNameLabel.bottomAnchor, constant: 16).isActive = true
    busRoutNumbersLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    busRoutNumbersLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
  }
}
