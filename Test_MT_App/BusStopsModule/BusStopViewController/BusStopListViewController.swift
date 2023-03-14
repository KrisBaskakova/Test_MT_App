//
//  ViewController.swift
//  Test_MT_App
//
//  Created by Кристина Баскакова on 28.02.2023.
//

import UIKit
import CoreLocation

final class BusStopListViewController: UIViewController {

  let output: BusStopPresenterProtocol
  
  var stops: [Stop]? {
    didSet {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
  private lazy var tableView = UITableView()
  
  init(output: BusStopPresenterProtocol) {
    self.output = output
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    output.viewDidLoad()
  }

  // MARK: Setup UI
  
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
    return stops?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let model = stops?[indexPath.row] else { return UITableViewCell() }
    let cell = tableView.dequeueReusableCell(withIdentifier: "stopCell") as! StopsTableViewCell
    cell.selectionStyle = .none
    cell.set(model: model)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let stops else { return }
    let mapViewController = ModulBuilder.createMapViewController(stop: stops[indexPath.row])
    self.navigationController?.pushViewController(mapViewController, animated: true)
  }
}

// MARK: BusStopViewProtocol extension

extension BusStopListViewController: BusStopViewProtocol {

  
}
