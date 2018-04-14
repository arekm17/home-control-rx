//
//  GetSettingsInfoUseCase.swift
//  Home Control
//
//  Created by Arek on 04.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation

protocol GetSettingsInfoUseCase {
    func execute(_ completion: @escaping ((SettingsInfo) -> ()))
}

struct GetSettingsInfoUseCaseImpl: GetSettingsInfoUseCase {
    
    var webSerivce: WebService
    let resource: Resource<SettingsInfo> = SettingsInfoResource.create()
    
    func execute(_ completion: @escaping ((SettingsInfo) -> ())) {
        webSerivce.getResource(resource) { result in
            
//            DispatchQueue.main.async(execute: {
//                switch result {
//                case .Error:
//                    completion(SettingsInfo.empty())
//                case .Success(let settingsInfo):
//                    completion(settingsInfo)
//                }
//
//            })
        }
        
    }
    
    
}
