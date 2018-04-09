//
//  Device.swift
//  Home Control
//
//  Created by Arek on 08.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation

enum DeviceType: String, Codable {
    case binary_light, dimmable_light, unknown_device, HC_user, blind, door_sensor,
    humidity_sensor, motion_sensor, temperature_sensor, smoke_sensor, water_sensor,
    weather, iOS_device, IP_camera, satel, satel_zone, satel_output, satel_partition
}

struct Device: Codable {
    let id: Int
    let roomID: Int
    let name: String
    let type: DeviceType
    let properties: DeviceProprties
}

struct DeviceProprties: Codable {
    let value: String?
}
