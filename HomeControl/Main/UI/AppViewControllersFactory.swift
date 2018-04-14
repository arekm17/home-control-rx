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
    
    func createRoomsViewController(_ sectionId: Int) -> RoomsViewController {
        let vc = Injector.shared().resolve(RoomsViewController.self)
        vc.sectionId = sectionId
        return vc
    }
    
    func createDevicesViewController(_ roomId: Int) -> DevicesViewController {
        let vc = Injector.shared().resolve(DevicesViewController.self)
        vc.roomId = roomId
        return vc
    }
    
}
