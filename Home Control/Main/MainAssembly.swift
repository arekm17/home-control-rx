//
//  MainAssembly.swift
//  Home Control
//
//  Created by Arek on 09.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class MainAssembly: Assembly {
    
    
    func assemble(container: Container) {
    
        container.autoregister(MainViewController.self, initializer: MainViewController.init)
        container.autoregister(InfoViewModel.self, initializer: InfoViewModel.init)
        container.autoregister(SectionsViewModel.self, initializer: SectionsViewModel.init)
        container.autoregister(GetSettingsInfoUseCase.self, initializer: GetSettingsInfoUseCase.init)
        container.autoregister(GetSectionsUseCase.self, initializer: GetSectionsUseCase.init)

        container.autoregister(AppFlowController.self, initializer: AppFlowController.init).inObjectScope(.container)
        container.autoregister(AppViewControllersFactory.self, initializer: AppViewControllersFactory.init)
        container.register(SectionsViewDelgate.self) { r in return r.resolve(AppFlowController.self)! }
    }
    
    
    
    
}