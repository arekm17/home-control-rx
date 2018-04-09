//
//  ChangeDimmableStateUseCase.swift
//  Home Control
//
//  Created by Arek on 08.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation

class ChangeDimmableStateUseCase {
    
    func execute(deviceId: Int, value: Int, completion: @escaping (Bool) -> ()) {
        
        WebService<Void>.getResource(ChangeDeviceValueResource.getResource(deviceId, value: value)) { result in
            
            DispatchQueue.main.async {
                if case .Success = result {
                    completion(true)
                } else {
                    completion(false)
                }
            }
            
        }
        
    }
    
}
