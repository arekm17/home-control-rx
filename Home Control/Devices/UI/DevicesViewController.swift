//
//  DevicesViewController.swift
//  Home Control
//
//  Created by Arek on 08.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation
import UIKit

class DevicesViewController: UIViewController {
    
    let viewModel: DevicesViewModel
    let deviceCellSource: DeviceCellSource
    
    let tableView = UITableView()
    
    var roomId: Int?
    
    init(viewModel: DevicesViewModel, deviceCellSource: DeviceCellSource) {
        self.viewModel = viewModel
        self.deviceCellSource = deviceCellSource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) not implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        self.title = "Devices"
        
        setupView()
        setupBinding()
        
        if let roomId = roomId {
            viewModel.setup(roomId)
        }
    }
    
    func setupView() {
        
        tableView.register(BinaryDeviceTableViewCell.self, forCellReuseIdentifier: BinaryDeviceTableViewCell.cellIdentifier)
        tableView.register(DimmableDeviceTableViewCell.self, forCellReuseIdentifier: DimmableDeviceTableViewCell.cellIdentifier)
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setupBinding() {
        viewModel.onDevicesLoaded = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
}

extension DevicesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.deviceViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return deviceCellSource.getBindedCell(tableView, viewModel.deviceViewModels[indexPath.row])        
    }
    
}
