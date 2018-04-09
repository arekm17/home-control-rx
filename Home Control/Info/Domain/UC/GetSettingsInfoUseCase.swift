//
//  GetSettingsInfoUseCase.swift
//  Home Control
//
//  Created by Arek on 04.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation

struct GetSettingsInfoUseCase {
    
    func execute(_ completion: @escaping ((SettingsInfo) -> ())) {
        
        WebService<SettingsInfo>.getResource(SettingsInfoResource.getResource()) { result in
            
            DispatchQueue.main.async {
                switch result {
                case .Error:
                    completion(SettingsInfo.empty())
                case .Success(let settingsInfo):
                    completion(settingsInfo)
                }

            }
        }
        
    }
    
    
}
