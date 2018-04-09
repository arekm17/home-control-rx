//
//  BinaryDeviceTableViewCell.swift
//  Home Control
//
//  Created by Arek on 08.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation
import UIKit

class BinaryDeviceTableViewCell: UITableViewCell {
   
    let label = UILabel()
    let switchButton = UISwitch()
    
    var viewModel: BinaryLightDeviceViewModel?
    
    static let cellIdentifier = String("BinaryDeviceTableViewCell")
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)

        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) not implemented")
    }
    
    func setupView() {
        
        self.addSubview(label)
        self.addSubview(switchButton)
        switchButton.addTarget(self, action: #selector(switchChanged), for: UIControlEvents.valueChanged)
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            ])

        switchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            switchButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            switchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            ])
    }
    
    func bind(viewModel: BinaryLightDeviceViewModel) {
        self.viewModel = viewModel
        label.text = viewModel.label
        switchButton.setOn(viewModel.checked!, animated: false)
        viewModel.switchStateChanged = { [weak self] in
            if let `self` = self, let checked = self.viewModel?.checked {
                self.switchButton.setOn(checked , animated: true)
            }
        }
    }
    
    @objc func switchChanged(sw: UISwitch) {
        if let viewModel = viewModel {
            viewModel.changeValue(sw.isOn)
        }
    }

}
