//
//  ChangeDeviceStateResource.swift
//  Home Control
//
//  Created by Arek on 08.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation

struct ChangeDeviceStateResource {
    
    
    static func getResource(_ deviceId: Int, value: String) -> Resource<Void> {
        return Resource(url: URL(string: "\(ApiConstants.baseUrl)/api/callAction?deviceID=\(deviceId)&name=\(value)")!,
                        parseMethod: ChangeDeviceStateResource.parseData,
                        expectedStatus: 202)
    }
    
    
    static func parseData(_ data: Data) throws -> Void { }
    
    
}
