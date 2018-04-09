//
//  BinaryLightDeviceViewModel.swift
//  Home Control
//
//  Created by Arek on 08.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation

class BinaryLightDeviceViewModel: DeviceViewModel {
 
    let changeBinaryStateUseCase: ChangeBinaryStateUseCase
    
    var switchStateChanged: (() -> ())?
    
    let label: String
    var checked: Bool
    private let deviceId: Int
    
    init(_ device: Device, _ changeBinaryStateUseCase: ChangeBinaryStateUseCase) {
        self.label = device.name
        self.checked = device.properties.value == "1"
        self.changeBinaryStateUseCase = changeBinaryStateUseCase
        self.deviceId = device.id
    }
    
    
    func changeValue(_ on: Bool) {
        changeBinaryStateUseCase.execute(deviceId: deviceId, value: on) { [weak self] success in
            if (success) {
                self?.checked = on
            }
            self?.switchStateChanged?()
        }
    }
    
}
