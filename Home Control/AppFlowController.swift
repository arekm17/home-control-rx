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
        let getRoomsUseCase = GetRoomsUseCase()
        let roomsViewModel = RoomsViewModel(getRoomsUseCase: getRoomsUseCase)
        let roomsViewController = RoomsViewController(viewModel: roomsViewModel)
        roomsViewController.sectionId = sectionId
        roomsViewController.delegate = self
        
        rootViewController.pushViewController(roomsViewController, animated: true)
    }
}

extension AppFlowController: RoomsViewControllerDelegate {
    func onRoomClicked(_ roomId: Int) {
        let getDevicesUseCase = GetDevicesUseCase()
        let devicesViewModel = DevicesViewModel(getDevicesUseCase: getDevicesUseCase, deviceViewModelsFactory: DeviceViewModelFacotry())
        let devicesViewController = DevicesViewController(viewModel: devicesViewModel, deviceCellSource: DeviceCellSource())
        devicesViewController.roomId = roomId

        rootViewController.pushViewController(devicesViewController, animated: true)
    }
}
