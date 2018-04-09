//
//  DeviceViewModelFacotry.swift
//  Home Control
//
//  Created by Arek on 08.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation

class DeviceViewModelFacotry {
    
    func createDeviceViewModel(_ device: Device) -> DeviceViewModel {
        
        if device.type == .binary_light {
            return BinaryLightDeviceViewModel(device, ChangeBinaryStateUseCase())
        } else {
            return DimmableLightDeviceViewModel(device, ChangeDimmableStateUseCase())
        }
    
    }
    
}
