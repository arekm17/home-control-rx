//
//  SectionsView.swift
//  Home Control
//
//  Created by Arek on 08.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation
import UIKit

protocol SectionsViewDelgate: class {
    func onSelectedSection(_ sectionId: Int)
}

class SectionsView: UITableView {
    
    private static let CellIdentifier = "Cell"
    
    let viewModel: SectionsViewModel
    weak var viewDelegate: SectionsViewDelgate?
    
    init(viewModel: SectionsViewModel, sectionsViewDelegate: SectionsViewDelgate) {
        self.viewModel = viewModel
        self.viewDelegate = sectionsViewDelegate
        super.init(frame: .zero, style: .plain)

        self.register(UITableViewCell.self, forCellReuseIdentifier: SectionsView.CellIdentifier)
        self.dataSource = self
        self.delegate = self

        setupBindings()
        self.viewModel.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) not implemented")
    }
    
    func setupBindings() {
        viewModel.onSectionsLoaded = { [weak self] in
            self?.reloadData()
        }
    }
    
}


extension SectionsView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return viewModel.sections.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SectionsView.CellIdentifier)!
        let section = viewModel.sections[indexPath.row]
        
        cell.textLabel?.text = section.name
        
        return cell
    }

    
}

extension SectionsView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewDelegate?.onSelectedSection(viewModel.sections[indexPath.row].id)
        self.deselectRow(at: indexPath, animated: true)
    }
    
}
