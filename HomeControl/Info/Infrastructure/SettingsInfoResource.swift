//
//  SettingsInfoResource.swift
//  Home Control
//
//  Created by Arek on 07.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation

//struct SettingsInfoResource: Resource2 {
//
//
//    var url: URL = URL(string: "\(ApiConstants.baseUrl)/api/settings/info")!
//
//    var parseMethod: ((Data) throws -> SettingsInfo) = { data in
//        return try JSONDecoder().decode(SettingsInfo.self, from: data)
//    }
//
//    var exceptedStatus: Int = 200
//
//    init() {}
//
//}

//struct SettingsInfoResource {
//
//    static func create() -> Resource<SettingsInfo> {
//        return Resource<SettingsInfo>(url: url, parseMethod: parseMethod)
//    }
//
//    private static var url: URL = URL(string: "\(ApiConstants.baseUrl)/api/settings/info")!
//
//    private static var parseMethod: ((Data) throws -> SettingsInfo) = { data in
//        return try JSONDecoder().decode(SettingsInfo.self, from: data)
//    }
//
//}

class SettingsInfoResource: Resource2 {
    
    static func create() -> Resource<SettingsInfo> {
        return Resource<SettingsInfo>(url: url, parseMethod: parseMethod)
    }
    
    private static var url: URL = URL(string: "\(ApiConstants.baseUrl)/api/settings/info")!
    
    private static var parseMethod: ((Data) throws -> SettingsInfo) = { data in
        return try JSONDecoder().decode(SettingsInfo.self, from: data)
    }
    
}
