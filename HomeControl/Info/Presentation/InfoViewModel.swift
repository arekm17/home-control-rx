//
//  InfoViewModel.swift
//  Home Control
//
//  Created by Arek on 04.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class InfoViewModel {
    
    let getSettingsInfoUseCase: GetSettingsInfoUseCase
    
    let serialNumber = BehaviorRelay<String>(value: "---")
    let macAddr = BehaviorRelay<String>(value: "---")
    let softVer = BehaviorRelay<String>(value: "---")

    var onInfoLoaded: ((SettingsInfo) -> ())?
    
    init(getSettingsInfoUseCase: GetSettingsInfoUseCase) {
        self.getSettingsInfoUseCase = getSettingsInfoUseCase
    }
    
    
    func setup() {
        
        getSettingsInfoUseCase.execute { [weak self] info in
            self?.serialNumber.accept(info.serialNumber)
            self?.macAddr.accept(info.mac)
            self?.softVer.accept(info.softVersion)
        }
        
    }
    
}
