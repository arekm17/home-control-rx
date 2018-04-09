//
//  InfoViewModel.swift
//  Home Control
//
//  Created by Arek on 04.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation


class InfoViewModel {
    
    let getSettingsInfoUseCase: GetSettingsInfoUseCase
    
    var onInfoLoaded: ((SettingsInfo) -> ())?
    
    init(getSettingsInfoUseCase: GetSettingsInfoUseCase) {
        self.getSettingsInfoUseCase = getSettingsInfoUseCase
    }
    
    
    func setup() {
        
        getSettingsInfoUseCase.execute { [weak self] info in
            self?.onInfoLoaded?(info)
        }
        
    }
    
}
