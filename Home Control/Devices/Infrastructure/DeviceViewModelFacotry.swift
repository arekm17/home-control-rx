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
            let vm = Injector.shared().resolve(BinaryLightDeviceViewModel.self)
            vm.setup(device: device)
            return vm
        } else {
            let vm = Injector.shared().resolve(DimmableLightDeviceViewModel.self)
            vm.setup(device: device)
            return vm
        }
    
    }
    
}
