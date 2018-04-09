//
//  AppViewControllersFactory.swift
//  Home Control
//
//  Created by Arek on 09.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation

class AppViewControllersFactory {
    
    
    func createMainViewController() -> MainViewController {
        return Injector.shared().resolve(MainViewController.self)
    }
    
    
}
