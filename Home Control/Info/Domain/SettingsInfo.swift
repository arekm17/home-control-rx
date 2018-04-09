//
//  SettingsInfo.swift
//  Home Control
//
//  Created by Arek on 04.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation

struct SettingsInfo: Codable {

    let serialNumber: String
    let mac: String
    let softVersion: String
    
}

extension SettingsInfo {
    
    static func empty() -> SettingsInfo {
        return SettingsInfo(serialNumber: "---+", mac: "---", softVersion: "---")
    }
    
}
