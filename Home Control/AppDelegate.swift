//
//  AppDelegate.swift
//  Home Control
//
//  Created by Arek on 04.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var flowController: AppFlowController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        Injector.shared().setUp()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        flowController = Injector.shared().resolve(AppFlowController.self)
        flowController?.setup()
        
        window?.rootViewController = flowController?.rootViewController
        window?.makeKeyAndVisible()

        return true
    }

}

