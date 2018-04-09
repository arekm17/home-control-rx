//
//  AppFlowController.swift
//  Home Control
//
//  Created by Arek on 04.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation
import UIKit

class AppFlowController {
    
    let rootViewController = UINavigationController()
    let viewControllersFactory: AppViewControllersFactory
    
    init(viewControllersFactory: AppViewControllersFactory) {
        self.viewControllersFactory = viewControllersFactory
    }
    
    func setup() {
        rootViewController.addChildViewController(viewControllersFactory.createMainViewController())
    }
    
}

extension AppFlowController: SectionsViewDelgate {
    func onSelectedSection(_ sectionId: Int) {
        rootViewController.pushViewController(viewControllersFactory.createRoomsViewController(sectionId), animated: true)
    }
}

extension AppFlowController: RoomsViewControllerDelegate {
    func onRoomClicked(_ roomId: Int) {
        rootViewController.pushViewController(viewControllersFactory.createDevicesViewController(roomId), animated: true)
    }
}
