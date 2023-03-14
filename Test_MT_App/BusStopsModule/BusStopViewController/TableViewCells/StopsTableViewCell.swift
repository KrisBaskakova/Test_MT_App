//
//  StopsTableViewCell.swift
//  Test_MT_App
//
//  Created by Кристина Баскакова on 28.02.2023.
//

import UIKit

class StopsTableViewCell: UITableViewCell {
  
  private lazy var containerView = UIView()
  private lazy var stopNameLabel = UILabel()
  private lazy var rournumberLabel = UILabel()
  private lazy var stopImage = UIImageView()
 
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    setupHierarhy()
    setupConfiguration()
    setupConstraints()
  }
  
  
  func set(model: Stop) {
    stopNameLabel.text = "\(model.name)"
  }
  
  
  private func setupHierarhy() {
    addSubview(containerView)
    containerView.addSubview(stopImage)
    containerView.addSubview(stopNameLabel)
    containerView.addSubview(rournumberLabel)
  }
  
  private func setupConfiguration() {
    setupContainerViewConfiguration()
    setupStopNameLabelConfiguration()
    setupStopImageConfiguration()
    setupRournumberLabelConfiguration()
  }
  
  private func setupContainerViewConfiguration() {
    containerView.layer.cornerRadius = 16
  }
  
  private func setupStopImageConfiguration() {
    stopImage.image = UIImage(named: "busStop")
  }
  
  private func setupStopNameLabelConfiguration() {
    stopNameLabel.font = .systemFont(ofSize: 18, weight: .bold)
  }
  
  private func setupRournumberLabelConfiguration() {
    rournumberLabel.font = .systemFont(ofSize: 14, weight: .regular)
  }
  
  private func setupConstraints() {
    setupContainerViewConstraint()
    setStopImageViewConstraints()
    setStopNameLabelConstraints()
  }
  
  private func setupContainerViewConstraint() {
    containerView.translatesAutoresizingMaskIntoConstraints = false
    containerView.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
    containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
  }
  
  private func setStopImageViewConstraints() {
    stopImage.translatesAutoresizingMaskIntoConstraints = false
    stopImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8).isActive = true
    stopImage.heightAnchor.constraint(equalToConstant: 52).isActive = true
    stopImage.widthAnchor.constraint(equalToConstant: 52).isActive = true
    stopImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
  }
  
  private func setStopNameLabelConstraints() {
    stopNameLabel.translatesAutoresizingMaskIntoConstraints = false
    stopNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 14).isActive = true
    stopNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 72).isActive = true
  }
  
}
