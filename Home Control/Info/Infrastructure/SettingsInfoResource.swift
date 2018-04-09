//
//  SettingsInfoResource.swift
//  Home Control
//
//  Created by Arek on 07.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation

struct SettingsInfoResource {
    
    static let SettingsInfoUrl = URL(string: "\(ApiConstants.baseUrl)/api/settings/info")!
    
    
    static func getResource() -> Resource<SettingsInfo> {
        return Resource<SettingsInfo>(url: SettingsInfoResource.SettingsInfoUrl,
                                      parseMethod: SettingsInfoResource.parseData )
    }
    
    static func parseData(_ data: Data) throws -> SettingsInfo {
        return try JSONDecoder().decode(SettingsInfo.self, from: data)
    }
}
