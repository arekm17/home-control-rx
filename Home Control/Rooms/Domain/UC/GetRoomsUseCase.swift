//
//  GetRoomsUseCase.swift
//  Home Control
//
//  Created by Arek on 08.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation

struct GetRoomsUseCase {
    
    func execute(_ sectionId: Int, _ completion: @escaping (([Room]) -> ())) {
        
        WebService.getResource(RoomsResource.getResource()) { result in
            
            DispatchQueue.main.async {
                switch result {
                case .Success(let rooms):
                    completion(rooms.filter { $0.sectionID == sectionId})
                case .Error:
                    completion([])
                }
            }
        }
        
    }
}
