//
//  ChangeBinaryStateUseCase.swift
//  Home Control
//
//  Created by Arek on 08.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation

class ChangeBinaryStateUseCase {
    
    func execute(deviceId: Int, value: Bool, completion: @escaping (Bool) -> ()) {
        
        WebServiceImpl.getResource(ChangeDeviceStateResource.getResource(deviceId, value: getActionString(value))) { result in
            
            DispatchQueue.main.async {
                if case .Success = result {
                    completion(true)
                } else {
                    completion(false)
                }
            }
            
        }
        
    }
    
    private func getActionString(_ value: Bool) -> String {
        return value ? "turnOn" : "turnOff"
    }

}
