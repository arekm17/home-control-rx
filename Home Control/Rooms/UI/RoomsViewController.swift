//
//  RoomsViewController.swift
//  Home Control
//
//  Created by Arek on 08.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation
import UIKit

protocol RoomsViewControllerDelegate: class {
    func onRoomClicked(_ roomId: Int)
}

class RoomsViewController: UIViewController {
    
    private static let CellIdentifier = "Cell"
    
    let viewModel: RoomsViewModel
    var delegate: RoomsViewControllerDelegate?
    
    var sectionId: Int?
    
    let tableView = UITableView()
    
    init(viewModel: RoomsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) not implemented")
    }
    
    override func viewDidLoad() {
        title = "Rooms"
        view.backgroundColor = .white
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: RoomsViewController.CellIdentifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        setupLayout()
        setupBinding()
        
        if let sectionId = sectionId {
            self.viewModel.setup(sectionId)
        }
    }
    
    func setupLayout() {
        
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
        viewModel.onRoomsLoaded = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension RoomsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RoomsViewController.CellIdentifier)!
        cell.textLabel?.text = viewModel.rooms[indexPath.row].name
        return cell
    }
    
}

extension RoomsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.onRoomClicked(viewModel.rooms[indexPath.row].id)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
