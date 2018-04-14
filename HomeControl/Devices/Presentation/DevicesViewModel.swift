//
//  DevicesViewModel.swift
//  Home Control
//
//  Created by Arek on 08.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation

class DevicesViewModel {
    
    let getDevicesUseCase: GetDevicesUseCase
    let deviceViewModelsFactory: DeviceViewModelFacotry
    
    var deviceViewModels: [DeviceViewModel] = []
    
    var onDevicesLoaded: (() -> ())?
    
    init(getDevicesUseCase: GetDevicesUseCase, deviceViewModelsFactory: DeviceViewModelFacotry) {
        self.getDevicesUseCase = getDevicesUseCase
        self.deviceViewModelsFactory = deviceViewModelsFactory
    }
    
    func setup(_ roomId: Int) {
        
        getDevicesUseCase.execute(roomId) { [weak self] devices in
            
            guard let `self` = self else { return }
            
            self.deviceViewModels = devices
                                        .map { self.deviceViewModelsFactory.createDeviceViewModel($0) }
            
            self.onDevicesLoaded?()

        }
        
    }
    
}
