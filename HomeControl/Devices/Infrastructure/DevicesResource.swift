//
//  DevicesResource.swift
//  Home Control
//
//  Created by Arek on 08.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation

struct DevicesResource {
    
    private static let url = URL(string: "\(ApiConstants.baseUrl)/api/devices")!
    
    static func getResource() -> Resource<[Device]> {
        return Resource(url: DevicesResource.url, parseMethod: DevicesResource.parseMethod)
    }
    
    private static func parseMethod(_ data: Data) throws -> [Device] {
        return try JSONDecoder().decode([Device].self, from: data)
    }
    
}
