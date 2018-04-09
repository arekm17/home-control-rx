//
//  DevicesAssembly.swift
//  Home Control
//
//  Created by Arek on 09.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class DevicesAssembly: Assembly {
    
    func assemble(container: Container) {

        container.autoregister(DevicesViewController.self, initializer: DevicesViewController.init)
        container.autoregister(DevicesViewModel.self, initializer: DevicesViewModel.init)
        container.autoregister(DeviceCellSource.self, initializer: DeviceCellSource.init)
        container.autoregister(GetDevicesUseCase.self, initializer: GetDevicesUseCase.init)
        container.autoregister(DeviceViewModelFacotry.self, initializer: DeviceViewModelFacotry.init)
        container.autoregister(ChangeBinaryStateUseCase.self, initializer: ChangeBinaryStateUseCase.init)
        container.autoregister(ChangeDimmableStateUseCase.self, initializer: ChangeDimmableStateUseCase.init)
        container.autoregister(BinaryLightDeviceViewModel.self, initializer: BinaryLightDeviceViewModel.init)
        container.autoregister(DimmableLightDeviceViewModel.self, initializer: DimmableLightDeviceViewModel.init)
        container.autoregister(ChangeDimmableStateUseCase.self, initializer: ChangeDimmableStateUseCase.init)
        
        
    }
    
}
