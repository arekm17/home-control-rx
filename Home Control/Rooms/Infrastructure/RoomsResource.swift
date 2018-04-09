//
//  RoomsResource.swift
//  Home Control
//
//  Created by Arek on 08.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation

struct RoomsResource {
    
    private static let url = URL(string: "\(ApiConstants.baseUrl)/api/rooms")!
    
    static func getResource() -> Resource<[Room]> {
        
        return Resource<[Room]>(url: RoomsResource.url, parseMethod: RoomsResource.parseMethod)
        
    }
    
    private static func parseMethod(_ data: Data) throws -> [Room] {
        return try JSONDecoder().decode([Room].self, from: data)
    }
    
}
