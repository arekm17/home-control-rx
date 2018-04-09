//
//  SectionsViewModel.swift
//  Home Control
//
//  Created by Arek on 08.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation


class SectionsViewModel {

    let getSectionsUseCase: GetSectionsUseCase
    
    var sections: [Section] = []
    
    var onSectionsLoaded: (() -> ())?
    
    init(getSectionsUseCase: GetSectionsUseCase) {
        self.getSectionsUseCase = getSectionsUseCase
    }
    
    func setup() {
        
        getSectionsUseCase.execute { [weak self] sections in
            self?.sections = sections
            self?.onSectionsLoaded?()
        }
        
    }
    
}
