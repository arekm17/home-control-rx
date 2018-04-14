//
//  DimmableLightDeviceViewModel.swift
//  Home Control
//
//  Created by Arek on 08.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation

class DimmableLightDeviceViewModel: DeviceViewModel {
    
    var label: String?
    var value: Float?
    var onValueChanged: (() -> ())?
    
    let changeDimmableStateUseCase: ChangeDimmableStateUseCase
    
    private var deviceId: Int?
    
    init(_ changeDimmableStateUseCase: ChangeDimmableStateUseCase) {
        self.changeDimmableStateUseCase = changeDimmableStateUseCase
    }
    
    func setup(device: Device) {
        self.label = device.name
        self.value = Float(device.properties.value!)!
        self.deviceId = device.id
    }
    
    func changeValue(_ value: Int) {
        changeDimmableStateUseCase.execute(deviceId: deviceId!, value: value) { [weak self] success in
            if (success) { self?.value = Float(value) }
            self?.onValueChanged?()
        }
    }
    
}
