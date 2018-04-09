//
//  SectionsResource.swift
//  Home Control
//
//  Created by Arek on 08.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation

struct SectionsResource {
    
    private static let url = URL(string: "\(ApiConstants.baseUrl)/api/sections")!
    
    static func getResource() -> Resource<[Section]> {
        return Resource<[Section]>(url: SectionsResource.url,
                                      parseMethod: SectionsResource.parseData )
    }
    
    static func parseData(_ data: Data) throws -> [Section] {
        return try JSONDecoder().decode([Section].self, from: data)
    }
}
