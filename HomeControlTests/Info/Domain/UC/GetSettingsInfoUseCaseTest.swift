
//
//  GetSettingsInfoUseCaseTest.swift
//  HomeControl
//
//  Created by Arek on 11.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation
import XCTest
import SwiftyMocky
@testable import HomeControl

class GetSettingsInfoUseCaseTest: XCTestCase {
    
    var useCase: GetSettingsInfoUseCase!
    var webService: WebService!
    var resource: Resource<SettingsInfo>!

    override func setUp() {
        super.setUp()
    
        webService = WebServiceMock()
        resource = SettingsInfoResource.create()
        
        useCase = GetSettingsInfoUseCaseImpl(webSerivce: webService, resource: resource)
        
    }
    
    
    func testShouldEmmitSettingsInfoWhenExecute() {
        
        //When
        
        
        
    }
    
}

//struct WebServiceMock: WebService {
//
//    var result: Result<SettingsInfo>
//
//    func getResource<SettingsInfo>(_ resource: Resource<SettingsInfo>, _ completion: @escaping ((Result<SettingsInfo>) -> ())) {
//
//        completion(result)
//
//    }
//
//
//
//
//
//}
//
