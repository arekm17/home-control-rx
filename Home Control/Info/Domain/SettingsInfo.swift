//
//  SettingsInfo.swift
//  Home Control
//
//  Created by Arek on 04.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation

struct SettingsInfo: Codable {
    //{"serialNumber":"HC2-000547","mac":"38:60:77:4e:b8:00","softVersion":"3.590","beta":false,"zwaveVersion":"3.42","serverStatus":1516168934,"defaultLanguage":"en","sunsetHour":"19:38","sunriseHour":"06:13","hotelMode":true,"updateStableAvailable":false,"temperatureUnit":"C","updateBetaAvailable":false,"batteryLowNotification":true,"smsManagement":true}
    let serialNumber: String
    let mac: String
    let softVersion: String
    
}

extension SettingsInfo {
    
    static func empty() -> SettingsInfo {
        return SettingsInfo(serialNumber: "---+", mac: "---", softVersion: "---")
    }
    
}
