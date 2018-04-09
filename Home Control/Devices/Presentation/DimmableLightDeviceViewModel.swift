//
//  DimmableLightDeviceViewModel.swift
//  Home Control
//
//  Created by Arek on 08.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation

class DimmableLightDeviceViewModel: DeviceViewModel {
    
    let label: String
    var value: Float
    var onValueChanged: (() -> ())?
    
    let changeDimmableStateUseCase: ChangeDimmableStateUseCase
    
    private let deviceId: Int
    
    init(_ device: Device, _ changeDimmableStateUseCase: ChangeDimmableStateUseCase) {
        self.label = device.name
        self.value = Float(device.properties.value!)!
        self.changeDimmableStateUseCase = changeDimmableStateUseCase
        self.deviceId = device.id
    }
    
    
    func changeValue(_ value: Int) {
        changeDimmableStateUseCase.execute(deviceId: deviceId, value: value) { [weak self] success in
            if (success) { self?.value = Float(value) }
            self?.onValueChanged?()
        }
    }
    
}
