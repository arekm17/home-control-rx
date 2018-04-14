//
//  RoomsAssembly.swift
//  Home Control
//
//  Created by Arek on 09.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class RoomsAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.autoregister(RoomsViewController.self, initializer: RoomsViewController.init)
        container.autoregister(RoomsViewModel.self, initializer: RoomsViewModel.init)
        container.autoregister(GetRoomsUseCase.self, initializer: GetRoomsUseCase.init)
        container.register(RoomsViewControllerDelegate.self) {r in r.resolve(AppFlowController.self)!}
        
    }
    
    
    
    
}
