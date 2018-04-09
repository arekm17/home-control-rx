//
//  GetSectionsUseCase.swift
//  Home Control
//
//  Created by Arek on 08.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation

struct GetSectionsUseCase {
    
    func execute(_ completion: @escaping (([Section]) -> ())) {
        
        WebService<[Section]>.getResource(SectionsResource.getResource()) { result in
            
            DispatchQueue.main.async {
                switch result {
                case .Error:
                    completion([])
                case .Success(let sections):
                    completion(sections)
                }
                
            }
        }
        
    }

}
