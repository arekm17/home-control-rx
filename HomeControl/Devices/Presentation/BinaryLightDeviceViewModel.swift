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
    
    var label: String?
    var checked: Bool?
    private var deviceId: Int?
    
    init(_ changeBinaryStateUseCase: ChangeBinaryStateUseCase) {
        self.changeBinaryStateUseCase = changeBinaryStateUseCase
    }
    
    func setup(device: Device) {
        self.label = device.name
        self.checked = device.properties.value == "1"
        self.deviceId = device.id
    }
    
    func changeValue(_ on: Bool) {
        changeBinaryStateUseCase.execute(deviceId: deviceId!, value: on) { [weak self] success in
            if (success) {
                self?.checked = on
            }
            self?.switchStateChanged?()
        }
    }
    
}
