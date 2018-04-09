//
//  GetDevicesUseCase.swift
//  Home Control
//
//  Created by Arek on 08.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation

struct GetDevicesUseCase {
    
    func execute(_ roomId: Int, _ completable: @escaping (([Device]) -> ())) {
        WebService<[Device]>.getResource(DevicesResource.getResource()) { result in
            
            DispatchQueue.main.async {
                switch result {
                case .Success(let devices):
                    let filtered = devices
                        .filter { $0.type == .binary_light || $0.type == .dimmable_light }
                        .filter { $0.roomID == roomId }
                    
                    completable(filtered)
                case .Error:
                    completable([])
                }
            }
            
        }
    }
    
    
}
