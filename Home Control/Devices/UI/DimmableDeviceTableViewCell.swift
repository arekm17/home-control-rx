//
//  DimmableDeviceTableViewCell.swift
//  Home Control
//
//  Created by Arek on 08.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation
import UIKit

class DimmableDeviceTableViewCell: UITableViewCell {
    
    static let cellIdentifier = String("DimmableDeviceTableViewCell")
    
    let label = UILabel()
    let slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.isContinuous = false
        return slider
    }()
    
    var viewModel: DimmableLightDeviceViewModel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)

        slider.addTarget(
            self,
            action: #selector(DimmableDeviceTableViewCell.sliderValueChanged(_:)),
            for: .valueChanged)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) not implemented")
    }
    
    func setupView() {
        
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalToConstant: 100),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            ])
        
        self.addSubview(slider)
        slider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            slider.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            slider.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 20),
            slider.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
        
    }
    
    func bind(viewModel: DimmableLightDeviceViewModel) {
        self.viewModel = viewModel
        self.label.text = viewModel.label
        slider.setValue(viewModel.value, animated: false)
        viewModel.onValueChanged = { [weak self] in
            if let `self` = self, let value = self.viewModel?.value {
                self.slider.setValue(value , animated: true)
            }
        }
    }
    
    @objc func sliderValueChanged(_ sender:UISlider!) {
        let value = sender.value
        viewModel?.changeValue(Int(value))
    }
    
    

}
