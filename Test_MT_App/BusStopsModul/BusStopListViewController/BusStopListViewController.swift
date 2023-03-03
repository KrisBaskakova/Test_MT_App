//
//  ViewController.swift
//  Test_MT_App
//
//  Created by Кристина Баскакова on 28.02.2023.
//

import UIKit

class BusStopListViewController: UIViewController {

  private lazy var tableView = UITableView()
  private let network = NetworkService.shared.getData()
  var busStopPresenter: BusStopPresenterProtocol!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  private func setupUI() {
    setupHierarchy()
    setupConstraints()
    setupTableViewConfiguration()
    tableViewCellRidistration()
  }
  
  private func tableViewCellRidistration() {
    tableView.register(StopsTableViewCell.self, forCellReuseIdentifier: "stopCell")
  }

  private func setupTableViewConfiguration() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = 76
  }
  
  private func setupHierarchy() {
    view.addSubview(tableView)
  }
  
  private func setupConstraints() {
    setupTableViewConstraints()
  }
  
  private func setupTableViewConstraints() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
  }
  
  
}

// MARK: TableViewCell extension

extension BusStopListViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return network.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "stopCell") as! StopsTableViewCell
    cell.selectionStyle = .none
    cell.set(model: network[indexPath.row])
    
    return cell
    
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.navigationController?.pushViewController(MapViewController(), animated: true)  }
}
