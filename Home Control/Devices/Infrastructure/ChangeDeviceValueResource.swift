//
//  ChangeDeviceValueResource.swift
//  Home Control
//
//  Created by Arek on 08.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation

struct ChangeDeviceValueResource {
    
    static func getResource(_ deviceId: Int, value: Int) -> Resource<Void> {
        return Resource(url: URL(string: "\(ApiConstants.baseUrl)/api/callAction?deviceID=\(deviceId)&name=setValue&arg1=\(value)")!,
                        parseMethod: ChangeDeviceValueResource.parseData,
                        exceptedStatus: 202)
    }
    
    
    static func parseData(_ data: Data) throws -> Void { }
    
}
