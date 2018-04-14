//
//  InfoViewModelTest.swift
//  Home ControlTests
//
//  Created by Arek on 09.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import XCTest
import RxCocoa
import RxSwift
@testable import HomeControl

class InfoViewModelTest: XCTestCase {
    
    var getSettingsUseCase: GetSettingsInfoUseCase?
    var viewModel: InfoViewModel!

    override func setUp() {
        super.setUp()
        
        getSettingsUseCase = GetSettingsInfoUseCaseMock()
        viewModel = InfoViewModel(getSettingsInfoUseCase: getSettingsUseCase!)
    }
 
    func testShouldShowInfoWhenSetup() {

        //When
        viewModel.setup()
        
        //Then
        XCTAssertEqual(viewModel.serialNumber.value, "serial")
        XCTAssertEqual(viewModel.macAddr.value, "mac")
        XCTAssertEqual(viewModel.softVer.value, "version")

    }
    
}

struct GetSettingsInfoUseCaseMock: GetSettingsInfoUseCase {
    
    func execute(_ completion: @escaping ((SettingsInfo) -> ())) {
        completion(SettingsInfo(serialNumber: "serial", mac: "mac", softVersion: "version"))
    }

    
}
